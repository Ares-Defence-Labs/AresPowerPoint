# PowerPoint slides, shapes, notes and media

`AresPowerPointSdk` authorizes presentation operations. A document's logical
sections are slides; separate native slide-group sections describe deck structure.
Slide indexes are zero-based and change after lifecycle/reorder operations.

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
