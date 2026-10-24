# PowerPoint slides, shapes, notes and media

`AresPowerPointSdk` authorizes presentation operations. A document's logical
sections are slides; separate native slide-group sections describe deck structure.
Slide indexes are zero-based and change after lifecycle/reorder operations.

## Parsed presentation models

The package entrypoint exports the parser's typed slide/element hierarchy,
including shapes, pictures, groups, tables, charts, paragraphs, text runs and
associated gradient, geometry, line-end, animation and media model types.
`AresPresentationElement` is sealed; use its exported concrete types to inspect
results from `AresPresentationParser`. Picture `decorative` preserves the native
Office flag and suppresses image speech semantics.

`AresPresentationAccessibility` and its report types are also exported. They
inspect a model or transform a native XML string; they do not authorize file IO.
Apply a supported transformation through the managed session and save via the SDK:

```dart
session.editPresentationXml(0, (xml) =>
  AresPresentationAccessibility.setDecorative(xml, objectId, true));
await sdk.save(session);
```

`objectId` is a native ID inspected from the current document, not a list index.
These source declarations are not a frozen protected-customer release contract.

## Edit slide objects

Use the session's `editPresentationXml(index, callback)` to apply a supported
`AresPresentationEditing` transform as one reversible change. `objects(xml)`
returns native object identities; IDs are not list positions. `addObject` adds a
text box or supported preset geometry. `updateObject` changes supported text,
position, size or rotation; duplicate/delete/reorder helpers manage object state.
The transform returns updated XML; do not mutate the package file behind a session.

Geometric helper dimensions use points and are converted to native drawing units;
slide-size APIs use explicitly named EMU units. Do not mix them. Unsupported
native structures may reject edits; arbitrary XML replacement can violate package
relationships and is an expert source integration, not a safe general-purpose API.
[Compilable shape recipe](../examples/presentation_workflows.dart)

## Notes, layouts and shows

The speaker-note dialog retains drafts after denied/failed authorization. Apply
rechecks host permission and the captured document/session so a background reload
cannot redirect the edit. Reopen after a source change, preserving needed draft
text first. This remains plain-note editing; rich formatting/fields are open.

`removeSlideComments(path, slideIndex:, expectedSourceFingerprint:)` deletes all
1–10,000 supported ordinary comments on one slide atomically. Unsupported sibling
records reject the entire operation. Other slides, author metadata and unrelated
parts remain. The Comments panel's Delete slide comments action confirms the
captured slide/count, rechecks host permission and supports one-step saved undo.
Close/reopen to target another slide. Modern threads are not included.

`removeAllComments(path, expectedSourceFingerprint:)` applies the same atomic
policy to the whole presentation (1–10,000 supported ordinary records). No
unsupported record is skipped. Empty owned parts/author registries remain for
later creation. Delete all presentation comments confirms the displayed count,
rechecks permission/source and supports one saved undo step.

Native legacy comments expose exact `positionX`/`positionY` decimal strings.
Use `addCommentCoordinates` or `moveCommentCoordinates` with string x/y arguments
for signed Int64 positions on every platform. The Move panel and native slide
reuse preserve them without browser number rounding. Inputs are limited to 128
lexical characters and canonicalized on write. Compatibility `x`/`y` integer
getters reject positions outside +/-9007199254740991; use string accessors for
wider values. Legacy `moveComment` retains 32-bit bounds. Pins, dragging, modern
threads and Microsoft/device acceptance remain unfinished.

`setSpeakerNotes` updates supported slide notes. Session APIs also expose supported
footer/date/number fields, slide size, theme parts, custom shows, show settings,
slide sections, timings, charts and freeform paths. Each has native format limits;
preserving imported master/timing/SmartArt/effect parts does not establish edit or
render parity. Use the [member reference](api-types.md) for exact types and the
[compatibility guide](compatibility.md) for unfinished features.

## Applying a freeform draft

Creating a freeform and editing an existing path both recheck host edit permission
and reload through the configured product loader before applying. The editor
captures the session, document, path, slide and selected object. Reloading or
changing that context while a picker, dialog or authorization is pending rejects
the draft; a changed source fingerprint requires reopening. A denied or expired
licence from the product loader also prevents application. Managed SDK saves
continue to verify the entitlement and source conflict independently.
Stale-context rejection is delivered through the host `onError` callback; SDK
surfaces do not show snackbars. Cancel performs no draft mutation or save.
Source fixtures validate these guards;
they do not establish issued customer/admin activation or protected release
acceptance.

DrawingML stores control points in a path coordinate space mapped to the shape
frame; see Microsoft's [point coordinates](https://learn.microsoft.com/en-us/dotnet/api/documentformat.openxml.drawing.point)
and [cubic path commands](https://learn.microsoft.com/en-us/dotnet/api/documentformat.openxml.drawing.cubicbeziercurveto).
These schema references are not an executed Microsoft application comparison.

## Coupled curve handles

The dialog's **Independent handles**, **Aligned handles** and **Mirrored handles**
selector applies to the selected vertex. Aligned movement keeps the opposite
arm's normalized length and rotates it to the opposite direction. Mirrored
movement gives both arms equal, opposite vectors. Independent movement leaves
the other handle unchanged. Choose a coupling mode before dragging a handle,
editing its coordinates or nudging it with the keyboard. Two existing handles
are required for coupling; **Curve / corner** can add handles. Picking a mode
initially aligns the opposite arm to the active handle (outgoing when the vertex
is selected). A zero direction with a nonzero opposite arm rejects aligned
movement; mirrored movement may collapse both arms to the vertex.

These are mathematical controls in normalized frame coordinates, not a claim
that Microsoft point-type commands or physical-length behavior on nonsquare
frames are fully reproduced. Coupling is dialog draft state; saved DrawingML
stores the resulting coordinates. Reopening starts in Independent mode without
changing the saved geometry. Vertex translations retain coupling; deleting a
point removes its draft mode, while splitting resets the two endpoint modes
and the inserted point to Independent to preserve exact subdivision geometry.
Cancel discards the draft. Both handles validate before any replacement.

```dart
final moved = path.moveHandle(vertexIndex, incoming: false,
  position: const Offset(.7, .3),
  constraint: AresFreeformHandleConstraint.mirrored);
// Pure path operation above; managed native edit below:
session.movePresentationFreeformHandle(slideIndex, objectId, vertexIndex,
  incoming: false, position: const Offset(.7, .3),
  constraint: AresFreeformHandleConstraint.aligned);
await sdk.save(session);
```

The pure helper returns an owned immutable vertex list and preserves other
vertices, path settings and the input. The managed operation is one undoable
native geometry change through existing domain, entitlement, source-conflict
and storage checks. Missing handles, unsupported imported geometry and invalid
coordinates reject without replacing the native shape. Million-unit native
rounding still applies. This does not finish point editing or freeform parity.

## Freeform point editing

Insert → Freeform creates a native editable single path; Edit points adjusts a
supported imported/authored path. The dialog supports touch, numeric coordinates
and keyboard controls. Focus its drawing area: arrows nudge by 0.001 frame units
(Shift: 0.01), Page Up/Down select vertices, Insert splits a segment, and
Delete/Backspace removes a point subject to the open/closed minimum. Split
segment also works without an Insert key. At an open path's final vertex it
splits the preceding segment. Straight and cubic segment subdivision retains
the original curve, within numeric/native coordinate precision; half parameter
is not necessarily half arc length.
Select Vertex, Incoming handle or Outgoing handle for precise independent handle
editing. Vertex moves translate both handles; out-of-range translations reject
atomically. Keyboard events are scoped to the focused canvas, leaving coordinate
text fields and modified host shortcuts alone. Invalid drafts report an error and remain editable. Cancel discards the draft;
Apply uses the existing native session/history and authorization path.

Use `AresFreeformPath.splitSegment(segmentIndex, t: .5)` for a pure owned-path
transformation. The segment index identifies its starting vertex; closed paths
include the final-to-first edge. Fractions must be finite and strictly between
zero and one; at most 512 vertices are supported. Use
`session.splitPresentationFreeformSegment(slideIndex, objectId, segmentIndex,
t: .5)` for one native undoable shape edit, then `sdk.save(session)`. Unsupported
imported geometry rejects without flattening. These APIs preserve other segments
and path settings; managed edit/save retain entitlement and source conflict checks.

Guide/arc/compound paths, Boolean geometry, persistent native point types,
physical-frame constraints and
Microsoft reference/all-platform acceptance remain incomplete. These controls
do not establish full PowerPoint parity or protected-customer delivery acceptance.

## Images, audio and video

The editor exposes image/stamp and audio/video host integrations. Provide
`onEmbedVideos`, `onEmbedAudio`, stamp callbacks and supported external commands
for your app's pickers. The host owns file access, retention and codec choices.
Browser playback uses local Blob URLs; Windows/Linux media use a native backend.
Codec/container/platform behavior requires actual runtime verification. A media
placeholder or stored relationship alone is not proof of successful playback,
embedded fonts, animation synchronization or presenter-mode equivalence.

The [PowerPoint screenshots](screenshots.md) show actual source widgets with synthetic
content and explicitly limited validation provenance.

## Scan to PowerPoint

Mobile capture/OCR retains structured source regions; review can correct text and
choose a template/transformation. Faithful, polished and summarized planning modes
produce different editable slide plans. They do not guarantee semantic accuracy
or exact reconstruction of a photographed page. [Scanner workflow](scanning.md)
