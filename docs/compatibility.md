# Compatibility and feature limits

PowerPoint provides slide lifecycle/reordering/import, sections, notes and supported legacy comments and drawing operations. The current feature ledger remains a partial feature inventory; it is not proof of full Microsoft parity. Supported plain legacy comments can now be merged during slide reuse with destination author/ID reconciliation. Imported timing, effects, SmartArt, advanced media/presenter behavior and the remaining Microsoft feature set are unfinished. That ledger is not a release certification.

New scanner output uses `.pptx`. Native templates and supported macro-enabled
containers may preserve parts, but macro/VBA execution is not provided by that
preservation. Import support is not a guarantee of lossless editing or rendering.
Legacy binary formats and text/CSV conversions have different fidelity limits;
retain originals and test your actual document corpus.

Unknown parts should survive supported unrelated operations; unsupported edits
must be rejected rather than silently flattening a document. Preservation,
extraction, UI exposure and host callbacks do not establish full feature parity.

Full Microsoft Word/Excel/PowerPoint parity is the requested target and remains
unfinished. Compatibility must be recorded against explicit desktop Office builds
and exercised through save/reopen/re-edit, undo/redo and platform tests. No new
physical-device or admin-mode certification is claimed by these documentation
screenshots. See [release gates](release-status.md).
