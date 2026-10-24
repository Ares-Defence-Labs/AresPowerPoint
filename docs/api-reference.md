# API reference — development snapshot

These declarations are extracted from the current source wrappers. They are
not a frozen release contract. Named option types are re-exported by
`package:ares_powerpoint/ares_powerpoint.dart`. The final narrowed API and complete dartdoc
site must be validated against the protected candidate before release.

## Domain SDK

```dart
AresPowerPointSdk({required super.licenceKey, super.verifyLicence});

Future<(AresOfficeSaveResult, int)> insertImage(
    String path, {
    required Uint8List bytes,
    required String fileName,
    required int slideIndex,
    String? expectedSourceFingerprint,
  });

Future<(AresOfficeSaveResult, int, String)> insertAudioObject(
    String path, {
    required Uint8List bytes,
    required String fileName,
    required int slideIndex,
    required Uint8List iconBytes,
    String? expectedSourceFingerprint,
  });

Future<(AresOfficeSaveResult, int, String)> insertVideoObject(
    String path, {
    required Uint8List bytes,
    required String fileName,
    required int slideIndex,
    required Uint8List posterBytes,
    String? expectedSourceFingerprint,
  });

Future<AresPresentationCommentsSnapshot> inspectComments(String path);

Future<List<AresPresentationComment>> comments(String path);

Future<AresPresentationCommentOperationResult> addComment(
    String path, {
    required int slideIndex,
    required String text,
    required String author,
    String initials = '',
    int x = 0,
    int y = 0,
    DateTime? date,
    String? expectedSourceFingerprint,
  });

Future<AresPresentationCommentOperationResult> replaceCommentText(
    String path,
    AresPresentationComment comment,
    String text, {
    DateTime? date,
    String? expectedSourceFingerprint,
  });

Future<AresPresentationCommentOperationResult> moveComment(
    String path,
    AresPresentationComment comment, {
    required int x,
    required int y,
    DateTime? date,
    String? expectedSourceFingerprint,
  });

Future<AresPresentationCommentOperationResult> addCommentCoordinates(
    String path, {
    required int slideIndex,
    required String text,
    required String author,
    String initials = '',
    String x = '0',
    String y = '0',
    DateTime? date,
    String? expectedSourceFingerprint,
  });

Future<AresPresentationCommentOperationResult> moveCommentCoordinates(
    String path,
    AresPresentationComment comment, {
    required String x,
    required String y,
    DateTime? date,
    String? expectedSourceFingerprint,
  });

Future<AresPresentationCommentOperationResult> removeSlideComments(
    String path, {
    required int slideIndex,
    String? expectedSourceFingerprint,
  });

Future<AresPresentationCommentOperationResult> removeAllComments(
    String path, {
    String? expectedSourceFingerprint,
  });

Future<AresPresentationCommentOperationResult> removeComment(
    String path,
    AresPresentationComment comment, {
    String? expectedSourceFingerprint,
  });

Future<AresOfficePageOperationResult> reuseSlides(
    String path, {
    required String sourcePath,
    required List<int> slideIndexes,
    required int afterIndex,
    AresSlideReuseFormatting formatting = AresSlideReuseFormatting.source,
    String? expectedSourceFingerprint,
    String? expectedImportFingerprint,
  });

Future<AresOfficePageOperationResult> moveSection(
    String path, {
    required String sectionId,
    required int toIndex,
    String? expectedSourceFingerprint,
  });

Future<AresOfficePageOperationResult> addSlide(
    String path, {
    required int afterIndex,
    String? expectedSourceFingerprint,
  });

Future<AresOfficePageOperationResult> duplicateSlide(
    String path, {
    required int index,
    String? expectedSourceFingerprint,
  });

Future<AresOfficePageOperationResult> deleteSlide(
    String path, {
    required int index,
    String? expectedSourceFingerprint,
  });

Future<AresOfficePageOperationResult> reorderSlides(
    String path, {
    required List<int> order,
    String? expectedSourceFingerprint,
  });

Future<AresOfficeScanGenerationResult?> scanToFile({
    required BuildContext context,
    required String outputPath,
    String? edgeSdkLicenceKey,
    bool isPro = false,
    AresPowerPointScanner? scanner,
    AresOfficePageRecognizer? recognizePages,
  });
```

## Common file and generation operations

The domain class fixes the product; do not construct or use a generic core SDK
to bypass product restrictions. `generateDocument` consumes already recognized
pages; it does not invoke the camera. `scanToFile` performs the complete workflow.

```dart
AresDomainSdk({
    required this.product,
    required this.licenceKey,
    this.verifyLicence,
  });

Future<AresOfficeDocument> createFromTemplate({
    required String templatePath,
    required String outputPath,
    bool overwrite = false,
  });

Future<AresOfficeSaveResult> saveAsTemplate({
    required AresOfficeEditSession session,
    required String outputPath,
    bool overwrite = false,
  });

Future<void> authorize();

Future<AresOfficeDocument> load(String path);

Future<List<AresOfficeAnnotation>> readAnnotations(String path);

Future<AresOfficeSaveResult> replaceAnnotations(
    String path, {
    required Iterable<AresOfficeAnnotation> annotations,
    String? expectedSourceFingerprint,
  });

Future<(AresOfficeSaveResult, AresOfficeAnnotation)> embedMedia(
    String path, {
    required Uint8List bytes,
    required String fileName,
    required int sectionIndex,
    Rect? initialRect,
    Map<String, Object?> metadata = const {},
    String? expectedSourceFingerprint,
  });

Future<AresOfficeSaveResult> confirmMediaPlacement(
    String path,
    String id,
    Rect rect, {
    String? expectedSourceFingerprint,
  });

Future<AresOfficeSaveResult> discardPendingMedia(
    String path,
    String id, {
    String? expectedSourceFingerprint,
  });

Future<AresOfficeDocument> loadBytes({
    required String name,
    required List<int> bytes,
    String? path,
    bool overwrite = false,
  });

Future<Uint8List> exportBytes(String path);

Future<AresDomainEditSession> edit(AresOfficeDocument document);

Future<AresOfficeSaveResult> save(
    AresOfficeEditSession session, {
    String? outputPath,
    bool overwrite = false,
  });

Future<AresOfficeScanGenerationResult> generateDocument({
    required String outputPath,
    required AresOfficeScanTemplate template,
    required List<AresOfficeRecognizedPage> pages,
    AresWordDocumentSettings wordSettings = const AresWordDocumentSettings(),
    AresWordFormOutput? formOutput,
    List<String> formSourcePaths = const [],
  });
```

## Scanner construction

```dart
const AresPowerPointScanner({
    super.key,
    required this.sdk,
    this.edgeSdkLicenceKey,
    this.isPro = false,
    this.scanMode = EdgeDetectionScannerMode.Balanced,
    this.templates,
    this.initialTemplateId,
    this.initialProcessingMode,
    this.initialScanOptions = const {},
    this.onCustomiseTemplates,
    this.onTemplateSelected,
    this.onPickFromGallery,
    this.onUpgrade,
  });
```

## Editor construction

```dart
const AresPowerPointEditor({
    super.key,
    required this.sdk,
    required this.documentPath,
    this.controller,
    this.viewerConfig = const AresOfficeViewerConfig(),
    this.appBarConfig = const AresOfficeViewerAppBarConfig(),
    this.toolsSheetConfig = const AresOfficeToolsSheetConfig(),
    this.theme,
    this.darkTheme,
    this.themeMode = ThemeMode.system,
    this.autoSaveEnabled = true,
    this.onDocumentReady,
    this.onDocumentModified,
    this.onDocumentSaved,
    this.onError,
    this.onRequestSaveAsPath,
    this.onRequestSaveAsFormatPath,
    this.onRequestReusePresentationPath,
    this.onRequestPdfExportPath,
    this.onExternalToolAction,
    this.onScanPage,
    this.showProBadge = false,
    this.onUpgrade,
    this.autoSaveIdleDelay = const Duration(milliseconds: 500),
    this.onAutoSaved,
    this.onDocumentImagesExtracted,
    this.onPdfExported,
    this.onDocumentCompressed,
    this.onTextExtracted,
    this.onRequestCompressedCopyPath,
    this.onRequestTextExportPath,
    this.onLoadCustomStamps,
    this.onScanWatermark,
    this.onEmbedVideos,
    this.onEmbedAudio,
  });
```

## Platform contract

`AresOfficePlatforms.editorTargets` and `documentApiTargets` require Android,
iOS, macOS, Windows, Linux and web. These are release requirements, not a list
of already certified builds. `scannerTargets` is Android/iOS only.
`AresOfficePlatforms.canScan` is a lightweight runtime check; it does not grant
a licence or camera permission. `requireScanner()` throws `UnsupportedError`
outside mobile. Import `package:ares_powerpoint/platforms.dart` to query this without
loading camera, OCR, editor or filesystem libraries.

## Models and low-level operations

`AresOfficeDocument` contains logical sections and the source fingerprint.
`AresOfficeSaveResult.document` is the reopened saved model. A domain edit session
tracks pending changes and in-session undo/redo; dispose it after use. Its
`undoSaved`/`redoSaved` methods operate on in-place saved history, and require no
pending edits. Saved history is not a durable cross-process recovery journal.

`AresOfficeScanTemplate`, `AresOfficeRecognizedPage` and
`AresOfficeScanGenerationResult` describe generation inputs and verified output.
OOXML operations may return operation-specific snapshots/results. Consult their
restriction/status fields before enabling mutations. Pass
`expectedSourceFingerprint` when a mutation supports it to prevent stale writes.

The current source still broadly exports shared core classes. Those exports are
under a [security boundary review](security-and-assets.md); direct low-level
helpers are not an independent authorization boundary. Customer distribution
requires a narrowed adapter API whose native operations enforce the product.

See [scanning](scanning.md), [editor lifecycle](editor.md) and the compilable
[integration example](../examples/scan_and_edit.dart). Exceptions include
`AresOfficeLicenceException`, invalid-domain/path errors and unsupported package
operations. Preserve the original on a failed edit and present a recoverable error.


## Domain edit-session signatures

Selected inherited session declarations relevant to this product; operations still enforce format and structure limits. See [full exported declarations](api-types.md) for helper/model types.

```dart
AresOfficeDocument get originalDocument;
AresOfficeDocument get document;
bool get isDirty;
bool get canUndo;
bool get canRedo;
void setWordHeaderFooter(AresWordHeaderFooterKind kind, {AresWordHeaderFooterVariant variant = AresWordHeaderFooterVariant.defaultPages, String? text, AresWordPageNumberAlignment? textAlignment, bool? textBold, bool? textItalic, bool? textUnderline, double? textFontSize, bool? pageNumber, AresWordPageNumberAlignment pageNumberAlignment = AresWordPageNumberAlignment.center, AresWordPageNumberFormat? pageNumberFormat, int? pageNumberStart});
void setWordPageNumbers({required bool enabled, AresWordHeaderFooterKind? kind, AresWordPageNumberAlignment alignment = AresWordPageNumberAlignment.center, AresWordPageNumberFormat? format, int? start});
void editPresentationPart(String path, String sourceXml);
void setPresentationFooters(int index, AresSlideFooter options);
void setSlideTimings(Map<int, int?> timings);
void setCustomShows(List<AresPresentationCustomShow> shows);
void setPresentationShowSettings(AresPresentationShowSettings settings);
void setSlideSections(List<AresPresentationSlideSection> sections);
void setPresentationTheme(String name, Map<String, String> colors, {String? headingFont, String? bodyFont});
void editSlideChart(int index, {String? relationshipId, required String title, required bool line, AresSlideChartKind? kind, int firstSliceAngle = 0, int holeSize = 50, bool showLegend = true, bool? showValues, bool? showPercent, required List<List<String>> rows});
void setSlideSize(int widthEmu, int heightEmu);
void replaceSectionText(int sectionIndex, String text);
void replaceWordTextRangeWithFormatting(int sectionIndex, int start, int end, String replacement, AresOfficeFormatChange style);
void setWordTableCell(int sectionIndex, int row, int column, String value, {int? fillColorArgb, String? verticalAlignment, String? textDirection, String? tableLayout, String? borderPreset, double? cellMarginPoints, double? columnWidthPoints, double? rowHeightPoints, String? rowHeightRule, bool? repeatHeaderRow, bool? preventRowSplit});
void applyWordTableStylePreset(int sectionIndex, AresWordTableStylePreset preset);
void formatWordTextRange(int sectionIndex, int start, int end, AresOfficeFormatChange style);
void clearWordTextRangeFormatting(int sectionIndex, int start, int end);
void clearWordParagraphFormatting(int sectionIndex);
bool wordParagraphHasListFormatting(int index);
int addPresentationFreeform(int sectionIndex, AresFreeformPath path, {String text = '', double x = 72, double y = 72, double width = 240, double height = 180});
void setPresentationFreeform(int sectionIndex, int objectId, AresFreeformPath path);
void editPresentationXml(int sectionIndex, String Function(String source) edit, {String? slideLayoutPath});
void updatePresentationOutline(Map<int, Map<int, String>> textBySlide, {Map<int, Map<int, List<int>>> paragraphLevelsBySlide = const <int, Map<int, List<int>>>{}});
void changePresentationTextCase(int sectionIndex, String mode);
void clearPresentationTextFormatting(int sectionIndex);
void setSpeakerNotes(int sectionIndex, String text);
void applyRangeFormatting(int sectionIndex, AresSpreadsheetRange range, AresOfficeFormatChange style);
void applyFormatting(AresOfficeFormatChange change);
AresOfficeFormatChange formattingFor({required int sectionIndex, int? row, int? column});
int replaceAll(String query, String replacement, {bool matchCase = false, bool wholeWords = false, bool includePresentationNotes = false});
int redactAll(String query, {String replacement = '[REDACTED]', bool matchCase = false, bool wholeWords = false, bool includePresentationNotes = false});
void undo();
void redo();
void refreshPackageMetadata(AresOfficeDocument refreshed);
void markSaved(AresOfficeDocument savedDocument);
void markSnapshotSaved(AresOfficeDocument savedDocument, AresOfficeDocument savedSnapshot);
void reset();
```

Saved-session history extensions (inherited by the domain alias):

```dart
final AresDomainSdk sdk;
bool get canUndoSaved;
bool get canRedoSaved;
Future<bool> undoSaved();
Future<bool> redoSaved();
void dispose();
void markSaved(AresOfficeDocument savedDocument);
void refreshPackageMetadata(AresOfficeDocument refreshed);
void markSnapshotSaved(AresOfficeDocument savedDocument, AresOfficeDocument savedSnapshot);
```
