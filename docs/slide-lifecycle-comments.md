# PowerPoint lifecycle, reuse, sections and comments

These operations write the saved PPTX immediately. Resolve pending session edits
first and reopen from the returned committed document afterwards.

| Operation | Inputs | Result/constraint |
| --- | --- | --- |
| `addSlide` | `afterIndex`, expected fingerprint | Adds a native slide; result includes current `activeIndex`. |
| `duplicateSlide` | Current `index`, fingerprint | Copies a supported slide and dependencies. |
| `deleteSlide` | Current `index`, fingerprint | Rejects unsupported/unsafe deletion; update current selection. |
| `reorderSlides` | Complete `order` permutation | Native deck reorder; use current indexes. |
| `reuseSlides` | Source path, indexes, insertion index, formatting | Snapshots selected source slides; optional source and target fingerprint checks. |
| `moveSection` | Native `sectionId`, final `toIndex` | Moves a native group and its slides, not a single logical slide. |

`AresSlideReuseFormatting.source` is the default formatting policy. Only modes
supported by the source API and current package should be offered. Supported
plain dated legacy comments are merged onto the imported slides with reconciled
author/indices and preserved text, initials, date and position. Modern/unknown
comment metadata and unsupported author graphs reject atomically; source files
remain unchanged. This is a bounded legacy subset, not complete collaboration. Preserve
originals and inspect external/embedded dependency restrictions. Neither slide
reuse nor a retained master is proof of complete PowerPoint rendering fidelity.
[Lifecycle/reuse example](../examples/presentation_workflows.dart)

## Legacy comments

`inspectComments` returns a snapshot with restrictions/fingerprint; inspect
`canCreate` and each comment's `canEdit`. `addComment` takes slide index, text,
author, optional initials/coordinates/date. Replace/remove takes a current native
comment object. Reinspect objects after changes instead of inventing identifiers.

`moveComment(path, comment, x:, y:, date:, expectedSourceFingerprint:)` updates a
supported legacy comment's position and modification date, preserving its body,
author identity, other comments and unrelated parts. The comment must still belong
to its recorded slide/part. The current portable move range is -2147483648 through
2147483647 per axis; this is an Ares editing bound, not the complete native schema.
These positions are document coordinates, separate from the shape helpers' points.
The panel offers Move comment, input validation, failed-draft retention, policy
rechecks and saved undo. It does not render or drag a geometric comment pin.
See [the native point attribute](https://learn.microsoft.com/en-us/dotnet/api/documentformat.openxml.presentation.point2dtype.x?view=openxml-3.0.1)
for the reference storage type. Wider coordinate authoring and reference rendering
remain open acceptance work.

The implementation handles supported legacy PresentationML comments. Modern
threaded/person-linked formats remain read-only unless their complete linked
metadata transformation is supported. Author and date fields are metadata, not
identity verification. Save and reopen after each accepted operation and verify
actual documents in PowerPoint. [Conflict handling](low-level-api.md)
