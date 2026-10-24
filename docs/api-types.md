# Exported type and member reference

Exported named classes, enums, typedefs and named extensions; declaration/member signatures only; conditional export union; inherited members listed on their declaring type; internal-annotated members omitted. Top-level functions, variables and unnamed extensions are outside this inventory. Not a frozen protected-customer API.

This is generated from the current canonical full import, not a hand-written claim that every helper is a stable customer API. Declaration origins identify libraries; they do not expose private paths or method bodies. Conditional storage implementations are listed as a union. Inherited declarations are listed on the declaring type. Domain aliases inherit session methods even when the session class is not exported by name. The final narrowed customer API remains a release gate.

Use [SDK constructors and operations](api-reference.md), [managed lifecycle](low-level-api.md) and [domain recipes](slides-shapes-media.md) alongside this reference.

**151 named exported declarations.** Machine-readable: [API inventory](api-inventory.json).

## AresDrawingPath

`package:ares_office_core/src/office_vector_icons.dart`

```dart
class AresDrawingPath
const AresDrawingPath(this.path, this.width, this.height, this.fill, this.stroke);
final Path path;
final double width, height;
final bool fill, stroke;
```

## AresExcelHyperlinkOperationResult

`package:ares_office_core/src/office_page_operations.dart`

```dart
class AresExcelHyperlinkOperationResult extends AresOfficePageOperationResult
const AresExcelHyperlinkOperationResult({required super.document, required super.activeIndex, required this.reference, required this.snapshot});
final String reference;
final AresExcelHyperlinksSnapshot snapshot;
```

## AresExcelNoteOperationResult

`package:ares_office_core/src/office_page_operations.dart`

```dart
class AresExcelNoteOperationResult extends AresOfficePageOperationResult
const AresExcelNoteOperationResult({required super.document, required super.activeIndex, required this.address, required this.snapshot});
final String address;
final AresExcelNotesSnapshot snapshot;
```

## AresFreeformHandleConstraint

`package:ares_office_core/src/office_presentation_freeform.dart`

```dart
enum AresFreeformHandleConstraint { independent, aligned, mirrored }
```

## AresFreeformPath

`package:ares_office_core/src/office_presentation_freeform.dart`

```dart
class AresFreeformPath
const AresFreeformPath(this.vertices, {this.closed = true, this.fill = true, this.stroke = true});
final List<AresFreeformVertex> vertices;
final bool closed, fill, stroke;
void validate();
AresFreeformPath moveHandle(int vertexIndex, {required bool incoming, required Offset position, AresFreeformHandleConstraint constraint = AresFreeformHandleConstraint.independent});
AresFreeformPath splitSegment(int segmentIndex, {double t = .5});
Path toPath(Size size);
```

## AresFreeformVertex

`package:ares_office_core/src/office_presentation_freeform.dart`

```dart
class AresFreeformVertex
const AresFreeformVertex(this.point, {this.incoming, this.outgoing});
final Offset point;
final Offset? incoming, outgoing;
```

## AresLineEnd

`package:ares_office_core/src/office_line_ends.dart`

```dart
class AresLineEnd
const AresLineEnd({this.type = 'none', this.width = 'med', this.length = 'med'});
final String type, width, length;
static const dynamic types;
static const dynamic sizes;
static AresLineEnd read(XmlElement? line, String tag);
Path path(double stroke);
void paint(Canvas canvas, Offset tip, Offset direction, Color color, double stroke);
```

## AresLinearGradientFill

`package:ares_office_core/src/office_gradient_fill.dart`

```dart
class AresLinearGradientFill extends Gradient
const AresLinearGradientFill({required super.colors, required super.stops, this.angle = 0, this.scaled = true, this.rotateWithShape = true, this.path, this.fillToRect = const Rect.fromLTRB(.5, .5, .5, .5), this.tileRect, this.nativeColorXml});
final double angle;
final bool scaled, rotateWithShape;
final String? path;
final Rect fillToRect;
final Rect? tileRect;
final List<String?>? nativeColorXml;
(Offset, Offset) endpoints(Rect rect);
ui.Shader createShader(Rect rect, {TextDirection? textDirection});
AresLinearGradientFill scale(double factor);
AresLinearGradientFill withOpacity(double opacity);
AresLinearGradientFill fromColor(Color color);
AresLinearGradientFill forRotation(double rotation);
```

## AresOfficeAnnotation

`package:ares_office_core/src/office_annotations.dart`

```dart
class AresOfficeAnnotation
const AresOfficeAnnotation({required this.id, required this.type, required this.sectionIndex, required this.created, this.text, this.author, this.start, this.end, this.colorValue, this.modified, this.data = const <String, Object?>{}});
final String id;
final AresOfficeAnnotationType type;
final int sectionIndex;
final DateTime created;
final String? text;
final String? author;
final int? start;
final int? end;
final int? colorValue;
final DateTime? modified;
final Map<String, Object?> data;
Map<String, Object?> toJson();
factory AresOfficeAnnotation.fromJson(Map<String, Object?> json);
```

## AresOfficeAnnotationStore

`package:ares_office_core/src/office_annotations.dart`

```dart
class AresOfficeAnnotationStore
const AresOfficeAnnotationStore();
Future<List<AresOfficeAnnotation>> load(String documentPath);
Future<void> save(String documentPath, Iterable<AresOfficeAnnotation> annotations);
Future<AresOfficeAnnotation> embedMedia(String documentPath, {required Uint8List bytes, required String fileName, required int sectionIndex, Rect? initialRect, Map<String, Object?> metadata = const <String, Object?>{}});
Future<List<PdfBoundMedia>> loadMedia(String documentPath);
static Rect mediaRect(AresOfficeAnnotation annotation);
Future<void> confirmMediaPlacement(String documentPath, String id, Rect rect);
Future<void> discardPendingMedia(String documentPath, String id);
```

## AresOfficeAnnotationType

`package:ares_office_core/src/office_annotations.dart`

```dart
enum AresOfficeAnnotationType { comment, highlight, underline, strikeout, link, stamp, drawing, redaction, attachment }
```

## AresOfficeCellBorders

`package:ares_office_core/src/office_document.dart`

```dart
enum AresOfficeCellBorders { none, all, bottom }
```

## AresOfficeChartInsertion

`package:ares_office_core/src/office_document.dart`

```dart
class AresOfficeChartInsertion
const AresOfficeChartInsertion({required this.id, required this.sectionIndex, required this.range, required this.title, this.line = false, required this.fromRow, required this.fromColumn});
final String id;
final int sectionIndex;
final String range;
final String title;
final bool line;
final int fromRow;
final int fromColumn;
```

## AresOfficeCompressionResult

`package:ares_office_core/src/office_service_utilities.dart`

```dart
class AresOfficeCompressionResult
const AresOfficeCompressionResult({required this.path, required this.originalBytes, required this.compressedBytes});
final String path;
final int originalBytes;
final int compressedBytes;
double get ratio;
```

## AresOfficeDisplayMode

`package:ares_office_core/src/office_editor_modes.dart`

```dart
enum AresOfficeDisplayMode { singleSection, continuous, twoPage, horizontal, grid }
```

## AresOfficeDocument

`package:ares_office_core/src/office_document.dart`

```dart
class AresOfficeDocument
const AresOfficeDocument({required this.path, required this.type, required this.sections, this.metadata = const AresOfficeDocumentMetadata(), this.formatChanges = const <AresOfficeFormatChange>[], this.sourceFingerprint, this.nativeEditingRestricted = false, this.slideWidthEmu, this.slideHeightEmu, this.date1904 = false, this.definedNames = const <AresExcelDefinedName>[], this.customShows = const <AresPresentationCustomShow>[], this.showSettings = const AresPresentationShowSettings(), this.slideSections = const <AresPresentationSlideSection>[], this.presentationPartChanges = const <AresPresentationPartChange>[], this.presentationThemeChanges = const <AresPresentationThemeChange>[], this.slideChartChanges = const <AresSlideChartChange>[], this.chartInsertions = const <AresOfficeChartInsertion>[], this.wordHeaderFooterChanges = const <AresWordHeaderFooterChange>[]});
final int? slideWidthEmu, slideHeightEmu;
final String path;
final AresOfficeDocumentType type;
final List<AresOfficeDocumentSection> sections;
final AresOfficeDocumentMetadata metadata;
final List<AresOfficeFormatChange> formatChanges;
final String? sourceFingerprint;
final bool nativeEditingRestricted;
final bool date1904;
final List<AresExcelDefinedName> definedNames;
final List<AresPresentationCustomShow> customShows;
final AresPresentationShowSettings showSettings;
final List<AresPresentationSlideSection> slideSections;
final List<AresPresentationPartChange> presentationPartChanges;
final List<AresPresentationThemeChange> presentationThemeChanges;
final List<AresSlideChartChange> slideChartChanges;
final List<AresOfficeChartInsertion> chartInsertions;
final List<AresWordHeaderFooterChange> wordHeaderFooterChanges;
String get text;
AresOfficeDocument copyWith({String? path, AresOfficeDocumentType? type, List<AresOfficeDocumentSection>? sections, AresOfficeDocumentMetadata? metadata, List<AresOfficeFormatChange>? formatChanges, String? sourceFingerprint, bool? nativeEditingRestricted, int? slideWidthEmu, int? slideHeightEmu, bool? date1904, List<AresExcelDefinedName>? definedNames, List<AresPresentationCustomShow>? customShows, AresPresentationShowSettings? showSettings, List<AresPresentationSlideSection>? slideSections, List<AresPresentationPartChange>? presentationPartChanges, List<AresPresentationThemeChange>? presentationThemeChanges, List<AresSlideChartChange>? slideChartChanges, List<AresOfficeChartInsertion>? chartInsertions, List<AresWordHeaderFooterChange>? wordHeaderFooterChanges});
```

## AresOfficeDocumentException

`package:ares_office_core/src/office_document.dart`

```dart
class AresOfficeDocumentException implements Exception
const AresOfficeDocumentException(this.message, {this.cause});
final String message;
final Object? cause;
String toString();
```

## AresOfficeDocumentMetadata

`package:ares_office_core/src/office_document.dart`

```dart
class AresOfficeDocumentMetadata
const AresOfficeDocumentMetadata({this.title, this.subject, this.creator, this.lastModifiedBy, this.description, this.keywords, this.category, this.application, this.company, this.created, this.modified, this.pageCount, this.wordCount, this.slideCount});
final String? title;
final String? subject;
final String? creator;
final String? lastModifiedBy;
final String? description;
final String? keywords;
final String? category;
final String? application;
final String? company;
final DateTime? created;
final DateTime? modified;
final int? pageCount;
final int? wordCount;
final int? slideCount;
bool get isEmpty;
```

## AresOfficeDocumentSection

`package:ares_office_core/src/office_document.dart`

```dart
class AresOfficeDocumentSection
const AresOfficeDocumentSection({required this.index, required this.title, required this.text, this.sourceSectionIndex, this.sourceXml, this.speakerNotes, this.slideLayoutPath, this.slideAudioRelationships = const <String, String>{}, this.isTable = false, this.rowCount, this.columnCount, this.cellValues, this.cellTypes = const <String, String>{}});
final int? sourceSectionIndex;
final String? sourceXml;
final String? speakerNotes;
final String? slideLayoutPath;
final Map<String, String> slideAudioRelationships;
final bool isTable;
final int index;
final String title;
final String text;
final int? rowCount;
final int? columnCount;
final List<List<String>>? cellValues;
final Map<String, String> cellTypes;
List<List<String>> get cells;
AresOfficeDocumentSection copyWith({int? index, int? sourceSectionIndex, String? sourceXml, String? speakerNotes, String? slideLayoutPath, Map<String, String>? slideAudioRelationships, bool? isTable, String? title, String? text, int? rowCount, int? columnCount, List<List<String>>? cellValues, Map<String, String>? cellTypes});
```

## AresOfficeDocumentType

`package:ares_office_core/src/office_document.dart`

```dart
enum AresOfficeDocumentType { word, spreadsheet, presentation, csv, text, markdown, unknown }
```

## AresOfficeEditorMode

`package:ares_office_core/src/office_editor_modes.dart`

```dart
enum AresOfficeEditorMode { view, page, navigation, ink, draw, edit, text, annotate, fillAndSign, prepareForm, insert, measure, redact, ai, favorites }
```

## AresOfficeEmbeddedImageExtractor

`package:ares_office_core/src/office_embedded_image_extractor.dart`

```dart
class AresOfficeEmbeddedImageExtractor
const AresOfficeEmbeddedImageExtractor({this.maximumCompressedBytes = 128 * 1024 * 1024, this.maximumExpandedBytes = 256 * 1024 * 1024, this.maximumImageBytes = 64 * 1024 * 1024, this.maximumArchiveEntries = 10000});
final int maximumCompressedBytes;
final int maximumExpandedBytes;
final int maximumImageBytes;
final int maximumArchiveEntries;
Future<AresOfficeImageExtractionResult> extract(String documentPath, {String? outputDirectory});
```

## AresOfficeEncryptedDocumentException

`package:ares_office_core/src/office_document.dart`

```dart
class AresOfficeEncryptedDocumentException extends AresOfficeDocumentException
const AresOfficeEncryptedDocumentException();
```

## AresOfficeExternalToolAction

`package:ares_office_core/src/office_document.dart`

```dart
class AresOfficeExternalToolAction
const AresOfficeExternalToolAction({required this.mode, required this.label, required this.documentPath, required this.documentType, required this.sectionIndex, this.selectedText, this.selectedSectionIndexes = const <int>[], this.insertImagePath, this.insertImageBytes, this.insertText});
final String mode;
final String label;
final String documentPath;
final AresOfficeDocumentType documentType;
final int sectionIndex;
final String? selectedText;
final List<int> selectedSectionIndexes;
final Future<void> Function(String path)? insertImagePath;
final Future<void> Function(Uint8List bytes)? insertImageBytes;
final Future<void> Function(String text)? insertText;
```

## AresOfficeExternalToolHandler

`package:ares_office_core/src/office_document.dart`

```dart
typedef AresOfficeExternalToolHandler = FutureOr<void> Function(AresOfficeExternalToolAction action);
```

## AresOfficeFormatChange

`package:ares_office_core/src/office_document.dart`

```dart
class AresOfficeFormatChange
const AresOfficeFormatChange({required this.sectionIndex, this.row, this.column, this.fontFamily, this.fontSize, this.bold, this.italic, this.underline, this.underlineStyle, this.strikethrough, this.textPosition, this.fontColorArgb, this.fillColorArgb, this.alignment, this.wrapText, this.numberFormatCode, this.paragraphStyle, this.listKind, this.spaceBeforePoints, this.spaceAfterPoints, this.lineSpacing, this.leftIndentPoints, this.rightIndentPoints, this.firstLineIndentPoints, this.keepWithNext, this.keepLinesTogether, this.widowOrphanControl, this.pageBreakBefore, this.suppressAutoHyphens, this.contextualSpacing, this.rightToLeft, this.tabStops, this.pageWidthPoints, this.pageHeightPoints, this.pageMarginTopPoints, this.pageMarginRightPoints, this.pageMarginBottomPoints, this.pageMarginLeftPoints, this.pageColumnCount, this.pageColumnSpacingPoints, this.verticalAlignment, this.cellBorders});
final int sectionIndex;
final int? row;
final int? column;
final String? fontFamily;
final double? fontSize;
final bool? bold;
final bool? italic;
final bool? underline;
final String? underlineStyle;
final bool? strikethrough;
final AresOfficeTextPosition? textPosition;
final int? fontColorArgb;
final int? fillColorArgb;
final AresOfficeHorizontalAlignment? alignment;
final bool? wrapText;
final String? numberFormatCode;
final String? paragraphStyle;
final String? listKind;
final double? spaceBeforePoints;
final double? spaceAfterPoints;
final double? lineSpacing;
final double? leftIndentPoints;
final double? rightIndentPoints;
final double? firstLineIndentPoints;
final bool? keepWithNext;
final bool? keepLinesTogether;
final bool? widowOrphanControl;
final bool? pageBreakBefore;
final bool? suppressAutoHyphens;
final bool? contextualSpacing;
final bool? rightToLeft;
final List<AresWordTabStop>? tabStops;
final double? pageWidthPoints;
final double? pageHeightPoints;
final double? pageMarginTopPoints;
final double? pageMarginRightPoints;
final double? pageMarginBottomPoints;
final double? pageMarginLeftPoints;
final int? pageColumnCount;
final double? pageColumnSpacingPoints;
final AresOfficeVerticalAlignment? verticalAlignment;
final AresOfficeCellBorders? cellBorders;
bool get targetsCell;
bool targets({required int sectionIndex, int? row, int? column});
AresOfficeFormatChange at({required int sectionIndex, int? row, int? column});
AresOfficeFormatChange merge(AresOfficeFormatChange other);
```

## AresOfficeGalleryCapture

`package:ares_office_core/src/scanner/ares_office_scanner_models.dart`

```dart
class AresOfficeGalleryCapture
const AresOfficeGalleryCapture({required this.bytes, required this.frame});
final Uint8List bytes;
final QuadFrame frame;
```

## AresOfficeGalleryPicker

`package:ares_office_core/src/scanner/ares_office_scanner.dart`

```dart
typedef AresOfficeGalleryPicker = FutureOr<AresOfficeGalleryCapture?> Function();
```

## AresOfficeHorizontalAlignment

`package:ares_office_core/src/office_document.dart`

```dart
enum AresOfficeHorizontalAlignment { left, center, right, justify }
```

## AresOfficeImageExtractionResult

`package:ares_office_core/src/office_embedded_image_extractor.dart`

```dart
class AresOfficeImageExtractionResult
AresOfficeImageExtractionResult({required this.images, required this.outputDirectory, required bool ownsOutputDirectory});
final List<ExtractedOfficeImage> images;
final String outputDirectory;
Future<void> discard();
```

## AresOfficeInteropExporter

`package:ares_office_core/src/office_interop_exporter.dart`

```dart
class AresOfficeInteropExporter
const AresOfficeInteropExporter();
Future<String> export(String sourcePath, {required String outputPath});
```

## AresOfficeLicence

`package:ares_office_core/src/sdk/ares_office_licence.dart`

```dart
class AresOfficeLicence
static Future<bool> verify(AresOfficeProduct product, String licenceKey);
```

## AresOfficeLicenceException

`package:ares_office_core/src/sdk/ares_domain_sdk.dart`

```dart
class AresOfficeLicenceException implements Exception
const AresOfficeLicenceException(this.product);
final AresOfficeProduct product;
String toString();
```

## AresOfficeLicenceVerifier

`package:ares_office_core/src/sdk/ares_domain_sdk.dart`

```dart
typedef AresOfficeLicenceVerifier = FutureOr<bool> Function(AresOfficeProduct product, String licenceKey);
```

## AresOfficeModeAction

`package:ares_office_core/src/office_editor_modes.dart`

```dart
class AresOfficeModeAction
const AresOfficeModeAction({required this.icon, required this.label, this.destructive = false, this.isPro = false});
final IconData icon;
final String label;
final bool destructive;
final bool isPro;
```

## AresOfficeModeDescriptor

`package:ares_office_core/src/office_editor_modes.dart`

```dart
class AresOfficeModeDescriptor
const AresOfficeModeDescriptor({required this.mode, required this.label, required this.icon});
final AresOfficeEditorMode mode;
final String label;
final IconData icon;
```

## AresOfficePackageFormat

`package:ares_office_core/src/office_package_format.dart`

```dart
enum AresOfficePackageFormat { docx, docm, dotx, dotm, xlsx, xlsm, xltx, xltm, pptx, pptm, potx, potm, ppsx, ppsm }
const AresOfficePackageFormat(this.extension, this.documentType, this.label, this.contentType, {this.isTemplate = false, this.supportsMacros = false});
final String extension;
final AresOfficeDocumentType documentType;
final String label;
final String contentType;
final bool isTemplate;
final bool supportsMacros;
String get mainPart;
static AresOfficePackageFormat? forPath(String path);
static List<AresOfficePackageFormat> forDocumentType(AresOfficeDocumentType type);
```

## AresOfficePageFitMode

`package:ares_office_core/src/office_editor_modes.dart`

```dart
enum AresOfficePageFitMode { fitPage, fitWidth, actualSize }
```

## AresOfficePageOperationResult

`package:ares_office_core/src/office_page_operations.dart`

```dart
class AresOfficePageOperationResult
const AresOfficePageOperationResult({required this.document, required this.activeIndex});
final AresOfficeDocument document;
final int activeIndex;
```

## AresOfficePageOperations

`package:ares_office_core/src/office_page_operations.dart`

```dart
class AresOfficePageOperations
const AresOfficePageOperations({this.loader = const AresOfficeDocumentLoader()});
final AresOfficeDocumentLoader loader;
Future<AresPresentationCommentsSnapshot> presentationComments(String path);
Future<AresPresentationCommentOperationResult> addPresentationComment(String path, {required int slideIndex, required String text, required String author, String initials = '', int x = 0, int y = 0, DateTime? date, String? expectedSourceFingerprint});
Future<AresPresentationCommentOperationResult> addPresentationCommentCoordinates(String path, {required int slideIndex, required String text, required String author, String initials = '', String x = '0', String y = '0', DateTime? date, String? expectedSourceFingerprint});
Future<AresPresentationCommentOperationResult> replacePresentationCommentText(String path, AresPresentationComment comment, String text, {DateTime? date, String? expectedSourceFingerprint});
Future<AresPresentationCommentOperationResult> movePresentationComment(String path, AresPresentationComment comment, {required int x, required int y, DateTime? date, String? expectedSourceFingerprint});
Future<AresPresentationCommentOperationResult> movePresentationCommentCoordinates(String path, AresPresentationComment comment, {required String x, required String y, DateTime? date, String? expectedSourceFingerprint});
Future<AresPresentationCommentOperationResult> removePresentationSlideComments(String path, {required int slideIndex, String? expectedSourceFingerprint});
Future<AresPresentationCommentOperationResult> removeAllPresentationComments(String path, {String? expectedSourceFingerprint});
Future<AresPresentationCommentOperationResult> removePresentationComment(String path, AresPresentationComment comment, {String? expectedSourceFingerprint});
Future<AresWordCommentsSnapshot> wordComments(String path);
Future<AresWordCommentCreationResult> addWordComment(String path, {required int sectionIndex, required String text, required String author, String? initials, int? startOffset, int? endOffset, DateTime? date, String? expectedSourceFingerprint});
Future<AresWordCommentCreationResult> addWordCommentThread(String path, {required int sectionIndex, required String text, required String author, String? initials, int? startOffset, int? endOffset, DateTime? date, String? expectedSourceFingerprint});
Future<AresWordCommentOperationResult> migrateLegacyWordComments(String path, {String? expectedSourceFingerprint});
Future<AresWordCommentOperationResult> replaceWordCommentText(String path, String id, String text, {String? expectedSourceFingerprint});
Future<AresWordCommentOperationResult> replyToWordComment(String path, String parentId, {required String text, required String author, String? initials, DateTime? date, String? expectedSourceFingerprint});
Future<AresWordCommentOperationResult> replaceWordThreadCommentText(String path, String id, String text, {String? expectedSourceFingerprint});
Future<AresWordCommentOperationResult> removeWordCommentReply(String path, String commentId, {String? expectedSourceFingerprint});
Future<AresWordCommentOperationResult> removeWordCommentThread(String path, String rootCommentId, {String? expectedSourceFingerprint});
Future<AresWordCommentOperationResult> setWordCommentThreadResolved(String path, String rootCommentId, {required bool resolved, String? expectedSourceFingerprint});
Future<AresWordCommentOperationResult> removeAllLegacyWordComments(String path, {String? expectedSourceFingerprint});
Future<AresWordCommentOperationResult> removeWordComment(String path, String id, {String? expectedSourceFingerprint});
Future<AresOfficePageOperationResult> reusePresentationSlides(String path, {required String sourcePath, required List<int> slideIndexes, required int afterIndex, AresSlideReuseFormatting formatting = AresSlideReuseFormatting.source, String? expectedSourceFingerprint, String? expectedImportFingerprint});
Future<AresOfficePageOperationResult> setExcelDefinedName(String path, AresExcelDefinedName value, {bool replace = false, String? expectedSourceFingerprint});
Future<AresOfficePageOperationResult> removeExcelDefinedName(String path, String name, {int? localSheetId, String? expectedSourceFingerprint});
Future<AresExcelNoteOperationResult> addExcelNote(String path, {required int sheetIndex, required String address, required String author, required String text, String? expectedSourceFingerprint});
Future<AresExcelNoteOperationResult> replaceExcelNoteText(String path, {required int sheetIndex, required String address, required String text, String? expectedSourceFingerprint});
Future<AresExcelNoteOperationResult> setExcelNotePlacement(String path, {required int sheetIndex, required String address, required AresExcelNotePlacement placement, String? expectedSourceFingerprint});
Future<AresExcelNoteOperationResult> setExcelNoteVisibility(String path, {required int sheetIndex, required String address, required bool visible, String? expectedSourceFingerprint});
Future<AresExcelNoteOperationResult> removeExcelNote(String path, {required int sheetIndex, required String address, String? expectedSourceFingerprint});
Future<AresExcelHyperlinksSnapshot> excelHyperlinks(String path, int sheetIndex);
Future<AresExcelHyperlinkOperationResult> setExcelHyperlink(String path, {required int sheetIndex, required String reference, String? target, String? location, String? display, String? tooltip, bool replace = false, String? expectedSourceFingerprint});
Future<AresExcelHyperlinkOperationResult> removeExcelHyperlink(String path, {required int sheetIndex, required String reference, String? expectedSourceFingerprint});
Future<AresExcelNotesSnapshot> excelNotes(String path, int sheetIndex);
Future<List<AresWordRevision>> wordRevisions(String path);
Future<AresOfficePageOperationResult> reviewWordRevisions(String path, List<AresWordRevision> revisions, AresWordRevisionDecision decision, {String? expectedSourceFingerprint});
Future<AresOfficePageOperationResult> reviewWordRevision(String path, AresWordRevision revision, AresWordRevisionDecision decision, {String? expectedSourceFingerprint});
Future<List<AresWordBookmark>> wordBookmarks(String documentPath);
Future<AresOfficePageOperationResult> addWordBookmark(String documentPath, {required int sectionIndex, required String name, int? startOffset, int? endOffset, int? endSectionIndex, String? expectedSourceFingerprint});
Future<AresOfficePageOperationResult> redefineWordBookmark(String documentPath, {required String name, required int sectionIndex, int? startOffset, int? endOffset, int? endSectionIndex, String? expectedSourceFingerprint});
Future<AresOfficePageOperationResult> renameWordBookmark(String documentPath, {required String name, required String newName, String? expectedSourceFingerprint});
Future<AresOfficePageOperationResult> removeWordBookmark(String documentPath, String name, {String? expectedSourceFingerprint});
Future<AresOfficePageOperationResult> addBlankPage(String documentPath, {required int afterIndex, String? expectedSourceFingerprint});
Future<AresOfficePageOperationResult> duplicatePage(String documentPath, {required int index, String? expectedSourceFingerprint});
Future<AresOfficePageOperationResult> deletePage(String documentPath, {required int index, String? expectedSourceFingerprint});
Future<AresOfficePageOperationResult> movePresentationSection(String path, {required String sectionId, required int toIndex, String? expectedSourceFingerprint});
Future<AresOfficePageOperationResult> reorderPages(String documentPath, {required List<int> order, String? expectedSourceFingerprint});
Future<AresOfficePageOperationResult> extractPage(String documentPath, {required int index, required String outputPath});
```

## AresOfficePageRecognizer

`package:ares_office_core/src/sdk/ares_scan_workflow.dart`

```dart
typedef AresOfficePageRecognizer = Future<List<AresOfficeRecognizedPage>> Function(List<String> imagePaths);
```

## AresOfficePdfExportOptions

`package:ares_office_core/src/office_pdf_exporter.dart`

```dart
class AresOfficePdfExportOptions
const AresOfficePdfExportOptions({this.pageFormat = PdfPageFormat.a4, this.margin = 32, this.maximumSpreadsheetColumns = 20, this.maximumSpreadsheetRows, this.maximumSections, this.maximumTextCharacters, this.useCurrentMediaPositions = false, this.font, this.boldFont, this.italicFont, this.boldItalicFont, this.fontFallback = const <pw.Font>[]});
final bool useCurrentMediaPositions;
final PdfPageFormat pageFormat;
final double margin;
final int maximumSpreadsheetColumns;
final int? maximumSpreadsheetRows;
final int? maximumSections;
final int? maximumTextCharacters;
final pw.Font? font;
final pw.Font? boldFont;
final pw.Font? italicFont, boldItalicFont;
final List<pw.Font> fontFallback;
```

## AresOfficePdfExportResult

`package:ares_office_core/src/office_pdf_exporter.dart`

```dart
class AresOfficePdfExportResult
const AresOfficePdfExportResult({required this.path, required this.bytesWritten, required this.pageCount});
final String path;
final int bytesWritten;
final int pageCount;
```

## AresOfficePdfExporter

`package:ares_office_core/src/office_pdf_exporter.dart`

```dart
class AresOfficePdfExporter
const AresOfficePdfExporter();
Future<AresOfficePdfExportResult> export(AresOfficeDocument document, {required String outputPath, AresOfficePdfExportOptions options = const AresOfficePdfExportOptions(), bool overwrite = false});
```

## AresOfficePlatform

`package:ares_office_core/src/sdk/ares_office_platforms.dart`

```dart
enum AresOfficePlatform { android, ios, macos, windows, linux, web }
```

## AresOfficePlatforms

`package:ares_office_core/src/sdk/ares_office_platforms.dart`

```dart
abstract final class AresOfficePlatforms
static const Set<AresOfficePlatform> editorTargets;
static const Set<AresOfficePlatform> documentApiTargets;
static const Set<AresOfficePlatform> scannerTargets;
static AresOfficePlatform get current;
static bool get canScan;
static void requireScanner();
```

## AresOfficeProduct

`package:ares_office_core/src/sdk/ares_office_product.dart`

```dart
enum AresOfficeProduct { word, excel, powerpoint }
```

## AresOfficeProductIdentity

`package:ares_office_core/src/sdk/ares_office_product.dart`

```dart
extension AresOfficeProductIdentity on AresOfficeProduct
String get sdkProduct;
```

## AresOfficeRawScanCapture

`package:ares_office_core/src/scanner/ares_office_scanner_models.dart`

```dart
class AresOfficeRawScanCapture
const AresOfficeRawScanCapture({required this.format, required this.template, required this.processingMode, required this.frames, this.wordDocumentOutput = AresWordDocumentOutput.editableDocument, this.wordSettings = const AresWordDocumentSettings(), this.notesSettings = const AresNotesSettings(), this.handwritingSettings = const AresHandwritingSettings(), this.formOutput = AresWordFormOutput.editableForm, this.excelOutput = AresExcelOutput.cleanTable, this.scanOptions = const {}, this.recognizedPages = const <AresOfficeRecognizedPage>[]});
final AresOfficeScannerFormat format;
final AresOfficeScanTemplate template;
final AresOfficeScanProcessingMode processingMode;
final List<QuadFrame> frames;
final AresWordDocumentOutput wordDocumentOutput;
final AresWordDocumentSettings wordSettings;
final AresNotesSettings notesSettings;
final AresHandwritingSettings handwritingSettings;
final AresWordFormOutput formOutput;
final AresExcelOutput excelOutput;
final Map<String, String> scanOptions;
final List<AresOfficeRecognizedPage> recognizedPages;
```

## AresOfficeReadingMode

`package:ares_office_core/src/office_editor_modes.dart`

```dart
enum AresOfficeReadingMode { light, dark, sepia, grayscale, highContrast }
```

## AresOfficeRecognizedPage

`package:ares_office_core/src/scanner/ares_office_scanner_models.dart`

```dart
class AresOfficeRecognizedPage
const AresOfficeRecognizedPage({required this.text, this.rows = const <List<String>>[], this.imagePaths = const <String>[], this.elements = const <AresWordScanElement>[], this.sourceAspectRatio, this.slidePlan, this.handwriting});
final double? sourceAspectRatio;
final AresSlidePlan? slidePlan;
final AresHandwritingPage? handwriting;
final String text;
final List<List<String>> rows;
final List<String> imagePaths;
final List<AresWordScanElement> elements;
```

## AresOfficeSampleDocuments

`package:ares_office_core/src/office_sample_documents.dart`

```dart
class AresOfficeSampleDocuments
static const String wordAssetPath;
static const String excelAssetPath;
static const String powerpointAssetPath;
static Future<String> installWordSample({required String outputPath, AssetBundle? bundle, bool overwrite = false});
static Future<String> installExcelSample({required String outputPath, AssetBundle? bundle, bool overwrite = false});
static Future<String> installPowerPointSample({required String outputPath, AssetBundle? bundle, bool overwrite = false});
```

## AresOfficeSaveAsFormatPathRequest

`package:ares_office_core/src/office_package_format.dart`

```dart
typedef AresOfficeSaveAsFormatPathRequest = Future<String?> Function(AresOfficeDocument document, AresOfficePackageFormat format);
```

## AresOfficeSaveConflictException

`package:ares_office_core/src/office_document.dart`

```dart
class AresOfficeSaveConflictException extends AresOfficeDocumentException
const AresOfficeSaveConflictException(super.message);
```

## AresOfficeSaveResult

`package:ares_office_core/src/office_document_writer.dart`

```dart
class AresOfficeSaveResult
const AresOfficeSaveResult({required this.path, required this.document, required this.bytesWritten, required this.sourceOverwritten});
final String path;
final AresOfficeDocument document;
final int bytesWritten;
final bool sourceOverwritten;
```

## AresOfficeScanGenerationResult

`package:ares_office_core/src/scanner/ares_office_scan_generator.dart`

```dart
class AresOfficeScanGenerationResult
const AresOfficeScanGenerationResult({required this.path, required this.document, required this.template});
final String path;
final AresOfficeDocument document;
final AresOfficeScanTemplate template;
```

## AresOfficeScanProcessingMode

`package:ares_office_core/src/scanner/ares_office_scanner_models.dart`

```dart
enum AresOfficeScanProcessingMode { wordLayout, wordText, wordForms, wordHandwriting, spreadsheetSmart, spreadsheetTables, spreadsheetReceipts, spreadsheetForms, spreadsheetInvoices, spreadsheetInventory, presentationAutoArrange }
```

## AresOfficeScanResult

`package:ares_office_core/src/scanner/ares_office_scanner_models.dart`

```dart
class AresOfficeScanResult
const AresOfficeScanResult({required this.format, required this.template, required this.processingMode, required this.imagePaths, this.wordDocumentOutput = AresWordDocumentOutput.editableDocument, this.wordSettings = const AresWordDocumentSettings(), this.notesSettings = const AresNotesSettings(), this.handwritingSettings = const AresHandwritingSettings(), this.formOutput = AresWordFormOutput.editableForm, this.excelOutput = AresExcelOutput.cleanTable, this.notesActions = const [], this.excelWorkbook, this.recognizedPages = const <AresOfficeRecognizedPage>[]});
final AresOfficeScannerFormat format;
final AresOfficeScanTemplate template;
final AresOfficeScanProcessingMode processingMode;
final List<String> imagePaths;
final AresWordDocumentOutput wordDocumentOutput;
final AresWordDocumentSettings wordSettings;
final AresNotesSettings notesSettings;
final AresHandwritingSettings handwritingSettings;
final AresWordFormOutput formOutput;
final AresExcelOutput excelOutput;
final List<AresNotesAction> notesActions;
final AresExcelWorkbook? excelWorkbook;
final List<AresOfficeRecognizedPage> recognizedPages;
```

## AresOfficeScanTemplate

`package:ares_office_core/src/scanner/ares_office_scanner_models.dart`

```dart
class AresOfficeScanTemplate
const AresOfficeScanTemplate({required this.id, required this.name, required this.description, required this.format, this.sourcePath, this.isUserTemplate = false, this.designId, this.previewBuilder});
final bool isUserTemplate;
final String? designId;
final String id;
final String name;
final String description;
final AresOfficeScannerFormat format;
final String? sourcePath;
final WidgetBuilder? previewBuilder;
bool get isCustom;
```

## AresOfficeScannerFormat

`package:ares_office_core/src/scanner/ares_office_scanner_models.dart`

```dart
enum AresOfficeScannerFormat { word, spreadsheet, presentation }
```

## AresOfficeSearchResult

`package:ares_office_core/src/office_document.dart`

```dart
class AresOfficeSearchResult
const AresOfficeSearchResult({required this.sectionIndex, required this.start, required this.length, required this.preview});
final int sectionIndex;
final int start;
final int length;
final String preview;
```

## AresOfficeSecurityInspector

`package:ares_office_core/src/office_security_inspector.dart`

```dart
class AresOfficeSecurityInspector
const AresOfficeSecurityInspector({this.maximumCompressedBytes = 128 * 1024 * 1024, this.maximumExpandedBytes = 256 * 1024 * 1024, this.maximumArchiveEntries = 10000});
final int maximumCompressedBytes;
final int maximumExpandedBytes;
final int maximumArchiveEntries;
Future<AresOfficeSecurityReport> inspect(String documentPath);
```

## AresOfficeSecurityReport

`package:ares_office_core/src/office_security_inspector.dart`

```dart
class AresOfficeSecurityReport
const AresOfficeSecurityReport({required this.isOpenXml, required this.isEncrypted, required this.hasDigitalSignatures, required this.hasMacros, required this.externalRelationshipCount, required this.embeddedObjectCount, required this.signaturePartCount});
final bool isOpenXml;
final bool isEncrypted;
final bool hasDigitalSignatures;
final bool hasMacros;
final int externalRelationshipCount;
final int embeddedObjectCount;
final int signaturePartCount;
```

## AresOfficeServiceUtilities

`package:ares_office_core/src/office_service_utilities.dart`

```dart
class AresOfficeServiceUtilities
const AresOfficeServiceUtilities({this.loader = const AresOfficeDocumentLoader()});
final AresOfficeDocumentLoader loader;
Future<AresOfficeCompressionResult> compress(String documentPath, {required String outputPath, int level = 9, bool overwrite = false});
Future<String> extractText(AresOfficeDocument document, {required String outputPath, bool overwrite = false});
```

## AresOfficeStorage

`package:ares_office_core/src/storage/ares_office_storage.dart`

```dart
abstract final class AresOfficeStorage
static Future<String> importBytes({required String name, required List<int> bytes, String? path, bool overwrite = false});
static Future<String> open(String path);
static Future<Uint8List> readBytes(String path);
static Future<List<String>> list({String? directoryPath});
static Future<void> remove(String path);
```

## AresOfficeStorageConflict

`package:ares_office_core/src/storage/office_storage_error.dart`

```dart
class AresOfficeStorageConflict extends AresOfficeStorageException
const AresOfficeStorageConflict();
```

## AresOfficeStorageException

`package:ares_office_core/src/storage/office_storage_error.dart`

```dart
class AresOfficeStorageException implements Exception
const AresOfficeStorageException(this.message);
final String message;
String toString();
```

## AresOfficeTemplateManagerLauncher

`package:ares_office_core/src/scanner/ares_office_scanner.dart`

```dart
typedef AresOfficeTemplateManagerLauncher = FutureOr<List<AresOfficeScanTemplate>?> Function(BuildContext context, AresOfficeScannerFormat format);
```

## AresOfficeTemplateSelectionChanged

`package:ares_office_core/src/scanner/ares_office_scanner.dart`

```dart
typedef AresOfficeTemplateSelectionChanged = FutureOr<void> Function(AresOfficeScanTemplate template);
```

## AresOfficeTextPosition

`package:ares_office_core/src/office_document.dart`

```dart
enum AresOfficeTextPosition { normal, superscript, subscript }
```

## AresOfficeToolConfig

`package:ares_office_core/src/office_viewer_config.dart`

```dart
class AresOfficeToolConfig
const AresOfficeToolConfig({required this.label, required this.icon, this.isPro = false});
final String label;
final IconData icon;
final bool isPro;
```

## AresOfficeToolsSheetConfig

`package:ares_office_core/src/office_viewer_config.dart`

```dart
class AresOfficeToolsSheetConfig
const AresOfficeToolsSheetConfig({this.header = 'Extra Document Tools', this.showSaveCopy = true, this.showShare = true, this.showPrint = true, this.showExportPdf = true, this.showReadAloud = true, this.showDocumentInfo = true, this.showExtractImages = true, this.showAnnotations = true, this.showCompress = true, this.showExtractText = true, this.showSecurityInfo = true, this.customTools = const <AresOfficeToolConfig>[]});
final String header;
final bool showSaveCopy;
final bool showShare;
final bool showPrint;
final bool showExportPdf;
final bool showReadAloud;
final bool showDocumentInfo;
final bool showExtractImages;
final bool showAnnotations;
final bool showCompress;
final bool showExtractText;
final bool showSecurityInfo;
final List<AresOfficeToolConfig> customTools;
```

## AresOfficeVerticalAlignment

`package:ares_office_core/src/office_document.dart`

```dart
enum AresOfficeVerticalAlignment { top, center, bottom }
```

## AresOfficeViewerAppBarConfig

`package:ares_office_core/src/office_viewer_config.dart`

```dart
class AresOfficeViewerAppBarConfig
const AresOfficeViewerAppBarConfig({this.title, this.showBackButton = true, this.showSearch = true, this.showTools = true});
final String? title;
final bool showBackButton;
final bool showSearch;
final bool showTools;
```

## AresOfficeViewerConfig

`package:ares_office_core/src/office_viewer_config.dart`

```dart
class AresOfficeViewerConfig
const AresOfficeViewerConfig({this.initialSectionIndex = 0, this.initialZoom = 1, this.minimumZoom = 0.75, this.maximumZoom = 4, this.showBottomNavigation = true, this.allowEditing = true, this.allowCopy = true, this.authorizeAction, this.commentAuthorName = '', this.photoTextRecognizer, this.supportedExternalTools = const <String>{}, this.padding = const EdgeInsets.only(bottom: 24)});
final int initialSectionIndex;
final double initialZoom;
final double minimumZoom;
final double maximumZoom;
final bool showBottomNavigation;
final bool allowEditing;
final bool allowCopy;
final String commentAuthorName;
final Future<bool> Function(String action)? authorizeAction;
final Future<List<AresWordScanElement>> Function(String path)? photoTextRecognizer;
final Set<String> supportedExternalTools;
final EdgeInsets padding;
```

## AresOfficeViewerController

`package:ares_office_core/src/office_viewer_controller.dart`

```dart
class AresOfficeViewerController extends ChangeNotifier
AresOfficeDocument? get document;
bool get isReady;
int get sectionIndex;
double get zoom;
String get searchQuery;
List<AresOfficeSearchResult> get searchResults;
int get activeSearchResult;
int get reloadGeneration;
Set<int> get bookmarkedSections;
int get sectionCount;
void goToSection(int index);
void nextSection();
void previousSection();
bool isSectionBookmarked(int index);
void toggleBookmark([int? sectionIndex]);
void clearBookmarks();
void setZoom(double zoom);
void zoomIn();
void zoomOut();
void resetZoom();
void search(String query);
void clearSearch();
void nextSearchResult();
void previousSearchResult();
void reload();
```

## AresPowerPointDocument

`package:ares_powerpoint/src/ares_powerpoint_sdk.dart`

```dart
typedef AresPowerPointDocument = AresOfficeDocument;
```

## AresPowerPointEditSession

`package:ares_powerpoint/src/ares_powerpoint_sdk.dart`

```dart
typedef AresPowerPointEditSession = AresDomainEditSession;
```

## AresPowerPointEditor

`package:ares_powerpoint/src/ares_powerpoint_sdk.dart`

```dart
class AresPowerPointEditor extends StatelessWidget
const AresPowerPointEditor({super.key, required this.sdk, required this.documentPath, this.controller, this.viewerConfig = const AresOfficeViewerConfig(), this.appBarConfig = const AresOfficeViewerAppBarConfig(), this.toolsSheetConfig = const AresOfficeToolsSheetConfig(), this.theme, this.darkTheme, this.themeMode = ThemeMode.system, this.autoSaveEnabled = true, this.onDocumentReady, this.onDocumentModified, this.onDocumentSaved, this.onError, this.onRequestSaveAsPath, this.onRequestSaveAsFormatPath, this.onRequestReusePresentationPath, this.onRequestPdfExportPath, this.onExternalToolAction, this.onScanPage, this.showProBadge = false, this.onUpgrade, this.autoSaveIdleDelay = const Duration(milliseconds: 500), this.onAutoSaved, this.onDocumentImagesExtracted, this.onPdfExported, this.onDocumentCompressed, this.onTextExtracted, this.onRequestCompressedCopyPath, this.onRequestTextExportPath, this.onLoadCustomStamps, this.onScanWatermark, this.onEmbedVideos, this.onEmbedAudio});
final AresPowerPointSdk sdk;
final String documentPath;
final AresOfficeViewerController? controller;
final AresOfficeViewerConfig viewerConfig;
final AresOfficeViewerAppBarConfig appBarConfig;
final AresOfficeToolsSheetConfig toolsSheetConfig;
final ThemeData? theme;
final ThemeData? darkTheme;
final ThemeMode themeMode;
final bool autoSaveEnabled;
final ValueChanged<AresOfficeDocument>? onDocumentReady;
final VoidCallback? onDocumentModified;
final ValueChanged<AresOfficeSaveResult>? onDocumentSaved;
final ValueChanged<Object>? onError;
final Future<String?> Function(AresOfficeDocument)? onRequestSaveAsPath;
final AresOfficeSaveAsFormatPathRequest? onRequestSaveAsFormatPath;
final Future<String?> Function(AresOfficeDocument)? onRequestReusePresentationPath;
final Future<String?> Function(AresOfficeDocument)? onRequestPdfExportPath;
final AresOfficeExternalToolHandler? onExternalToolAction;
final Future<AresOfficeScanResult?> Function(AresOfficeExternalToolAction)? onScanPage;
final bool showProBadge;
final VoidCallback? onUpgrade;
final Duration autoSaveIdleDelay;
final ValueChanged<AresOfficeSaveResult>? onAutoSaved;
final ValueChanged<AresOfficeImageExtractionResult>? onDocumentImagesExtracted;
final ValueChanged<AresOfficePdfExportResult>? onPdfExported;
final ValueChanged<AresOfficeCompressionResult>? onDocumentCompressed;
final ValueChanged<String>? onTextExtracted;
final Future<String?> Function(AresOfficeDocument)? onRequestCompressedCopyPath;
final Future<String?> Function(AresOfficeDocument)? onRequestTextExportPath;
final Future<List<AresStampModel>> Function()? onLoadCustomStamps;
final Future<AresStampModel?> Function()? onScanWatermark;
final Future<List<String>?> Function()? onEmbedVideos;
final Future<String?> Function()? onEmbedAudio;
Widget build(BuildContext context);
```

## AresPowerPointOutput

`package:ares_office_core/src/scanner/ares_powerpoint_scan.dart`

```dart
enum AresPowerPointOutput { singleSlide, multiSlide }
```

## AresPowerPointPlanPreview

`package:ares_office_core/src/scanner/ares_powerpoint_review.dart`

```dart
class AresPowerPointPlanPreview extends StatelessWidget
const AresPowerPointPlanPreview({super.key, required this.plan});
final AresSlidePlan plan;
Widget build(BuildContext context);
```

## AresPowerPointReviewResult

`package:ares_office_core/src/scanner/ares_powerpoint_review.dart`

```dart
class AresPowerPointReviewResult
const AresPowerPointReviewResult(this.template, this.pages);
final AresOfficeScanTemplate template;
final List<AresOfficeRecognizedPage> pages;
```

## AresPowerPointReviewScreen

`package:ares_office_core/src/scanner/ares_powerpoint_review.dart`

```dart
class AresPowerPointReviewScreen extends StatefulWidget
const AresPowerPointReviewScreen({super.key, required this.prepare, required this.templates, required this.initialTemplate});
final Future<List<AresStructuredScan>> Function() prepare;
final List<AresOfficeScanTemplate> templates;
final AresOfficeScanTemplate initialTemplate;
State<AresPowerPointReviewScreen> createState();
```

## AresPowerPointScanMode

`package:ares_office_core/src/scanner/ares_powerpoint_scan.dart`

```dart
enum AresPowerPointScanMode { document, whiteboard, understand }
```

## AresPowerPointScanner

`package:ares_powerpoint/src/ares_powerpoint_sdk.dart`

```dart
class AresPowerPointScanner extends StatelessWidget
const AresPowerPointScanner({super.key, required this.sdk, this.edgeSdkLicenceKey, this.isPro = false, this.scanMode = EdgeDetectionScannerMode.Balanced, this.templates, this.initialTemplateId, this.initialProcessingMode, this.initialScanOptions = const {}, this.onCustomiseTemplates, this.onTemplateSelected, this.onPickFromGallery, this.onUpgrade});
final AresPowerPointSdk sdk;
final String? edgeSdkLicenceKey;
final bool isPro;
final EdgeDetectionScannerMode scanMode;
final List<AresOfficeScanTemplate>? templates;
final String? initialTemplateId;
final AresOfficeScanProcessingMode? initialProcessingMode;
final Map<String, String> initialScanOptions;
final AresOfficeTemplateManagerLauncher? onCustomiseTemplates;
final AresOfficeTemplateSelectionChanged? onTemplateSelected;
final AresOfficeGalleryPicker? onPickFromGallery;
final Future<void> Function()? onUpgrade;
Widget build(BuildContext context);
```

## AresPowerPointSdk

`package:ares_powerpoint/src/ares_powerpoint_sdk.dart`

```dart
class AresPowerPointSdk extends AresDomainSdk
AresPowerPointSdk({required super.licenceKey, super.verifyLicence});
Future<AresPresentationLayout> loadLayout(String path);
Future<(AresOfficeSaveResult, int)> insertImage(String path, {required Uint8List bytes, required String fileName, required int slideIndex, String? expectedSourceFingerprint});
Future<AresOfficeSaveResult> replacePicture(String path, {required Uint8List bytes, required String fileName, required int slideIndex, required int objectId, bool clearCrop = false, String? expectedSourceFingerprint});
Future<AresOfficeSaveResult> compressPicture(String path, {required int slideIndex, required int objectId, required int pixelsPerInch, bool applyCropToRaster = false, String? expectedSourceFingerprint});
Future<(AresOfficeSaveResult, int, String)> insertAudioObject(String path, {required Uint8List bytes, required String fileName, required int slideIndex, required Uint8List iconBytes, String? expectedSourceFingerprint});
Future<(AresOfficeSaveResult, int, String)> insertVideoObject(String path, {required Uint8List bytes, required String fileName, required int slideIndex, required Uint8List posterBytes, String? expectedSourceFingerprint});
Future<AresPresentationCommentsSnapshot> inspectComments(String path);
Future<List<AresPresentationComment>> comments(String path);
Future<AresPresentationCommentOperationResult> addComment(String path, {required int slideIndex, required String text, required String author, String initials = '', int x = 0, int y = 0, DateTime? date, String? expectedSourceFingerprint});
Future<AresPresentationCommentOperationResult> replaceCommentText(String path, AresPresentationComment comment, String text, {DateTime? date, String? expectedSourceFingerprint});
Future<AresPresentationCommentOperationResult> moveComment(String path, AresPresentationComment comment, {required int x, required int y, DateTime? date, String? expectedSourceFingerprint});
Future<AresPresentationCommentOperationResult> addCommentCoordinates(String path, {required int slideIndex, required String text, required String author, String initials = '', String x = '0', String y = '0', DateTime? date, String? expectedSourceFingerprint});
Future<AresPresentationCommentOperationResult> moveCommentCoordinates(String path, AresPresentationComment comment, {required String x, required String y, DateTime? date, String? expectedSourceFingerprint});
Future<AresPresentationCommentOperationResult> removeSlideComments(String path, {required int slideIndex, String? expectedSourceFingerprint});
Future<AresPresentationCommentOperationResult> removeAllComments(String path, {String? expectedSourceFingerprint});
Future<AresPresentationCommentOperationResult> removeComment(String path, AresPresentationComment comment, {String? expectedSourceFingerprint});
Future<AresOfficePageOperationResult> reuseSlides(String path, {required String sourcePath, required List<int> slideIndexes, required int afterIndex, AresSlideReuseFormatting formatting = AresSlideReuseFormatting.source, String? expectedSourceFingerprint, String? expectedImportFingerprint});
Future<AresOfficePageOperationResult> moveSection(String path, {required String sectionId, required int toIndex, String? expectedSourceFingerprint});
Future<AresOfficePageOperationResult> addSlide(String path, {required int afterIndex, String? expectedSourceFingerprint});
Future<AresOfficePageOperationResult> duplicateSlide(String path, {required int index, String? expectedSourceFingerprint});
Future<AresOfficePageOperationResult> deleteSlide(String path, {required int index, String? expectedSourceFingerprint});
Future<AresOfficePageOperationResult> reorderSlides(String path, {required List<int> order, String? expectedSourceFingerprint});
Future<AresOfficeScanGenerationResult?> scanToFile({required BuildContext context, required String outputPath, String? edgeSdkLicenceKey, bool isPro = false, AresPowerPointScanner? scanner, AresOfficePageRecognizer? recognizePages});
```

## AresPowerPointSlideshow

`package:ares_office_core/src/presentation_file_preview.dart`

```dart
class AresPowerPointSlideshow extends StatefulWidget
const AresPowerPointSlideshow({super.key, required this.document, this.initialSlide = 0, this.slideOrder, this.autoPlay = false, this.allowAutoPlay = true, this.loop = false, this.showAnimations = true, this.allowManualNavigation = true, this.presenterView = false, this.autoPlayInterval = const Duration(seconds: 5), this.onReady, this.onSlideChanged, this.onExit, this.onAnimationSoundPlayed, this.onVideoPlayed, this.onAnimationSoundsStopped});
final AresOfficeDocument document;
final int initialSlide;
final List<int>? slideOrder;
final bool autoPlay;
final bool allowAutoPlay;
final bool loop;
final bool showAnimations;
final bool allowManualNavigation;
final bool presenterView;
final Duration autoPlayInterval;
final VoidCallback? onReady;
final ValueChanged<int>? onSlideChanged;
final VoidCallback? onExit;
final ValueChanged<AresPresentationSound>? onAnimationSoundPlayed;
final ValueChanged<AresPresentationSound>? onVideoPlayed;
final VoidCallback? onAnimationSoundsStopped;
State<AresPowerPointSlideshow> createState();
```

## AresPowerPointTransformation

`package:ares_office_core/src/scanner/ares_powerpoint_scan.dart`

```dart
enum AresPowerPointTransformation { faithful, polished, summarised }
```

## AresPresentationAccessibility

`package:ares_office_core/src/office_presentation_accessibility.dart`

```dart
class AresPresentationAccessibility
static Iterable<XmlElement> elements(XmlNode n, String name);
static List<AresPresentationDescription> inspect(AresOfficeDocument document);
static List<AresPresentationSlideTitle> inspectTitles(AresOfficeDocument document);
static List<AresPresentationHyperlinkIssue> inspectHyperlinks(AresOfficeDocument document);
static String setHyperlinkText(String source, int index, String text);
static String setSlideTitle(String source, String title);
static bool isDecorative(XmlElement properties);
static String setDecorative(String source, int id, bool decorative);
static String setDescription(String source, int id, String description);
```

## AresPresentationAutofit

`package:ares_office_core/src/presentation_file_preview.dart`

```dart
enum AresPresentationAutofit { none, shrinkText, resizeShape }
```

## AresPresentationBevel

`package:ares_office_core/src/presentation_file_preview.dart`

```dart
class AresPresentationBevel
const AresPresentationBevel({required this.preset, required this.width, required this.height});
final String preset;
final double width, height;
```

## AresPresentationChart

`package:ares_office_core/src/presentation_file_preview.dart`

```dart
class AresPresentationChart extends AresPresentationElement
final String title;
const AresPresentationChart({this.title = '', this.gapWidth = 150, this.overlap = 0, this.percentStacked = false, this.horizontal = false, this.stacked = false, this.firstSliceAngle = 0, this.holeFraction = .5, this.varyColors = true, this.showPercent = false, super.id, super.alternativeText, required super.x, required super.y, required super.width, required super.height, required super.rotation, required this.type, required this.categories, required this.series, required this.background, required this.hasLegend, required this.showValues});
final double firstSliceAngle, holeFraction;
final bool varyColors, showPercent;
final bool horizontal, stacked, percentStacked;
final double gapWidth, overlap;
final AresPresentationChartType type;
final List<String> categories;
final List<AresPresentationChartSeries> series;
final Color background;
final bool hasLegend;
final bool showValues;
```

## AresPresentationChartSeries

`package:ares_office_core/src/presentation_file_preview.dart`

```dart
class AresPresentationChartSeries
const AresPresentationChartSeries({this.pointColors = const {}, required this.name, required this.values, required this.color});
final Map<int, Color> pointColors;
final String name;
final List<double> values;
final Color color;
```

## AresPresentationChartType

`package:ares_office_core/src/presentation_file_preview.dart`

```dart
enum AresPresentationChartType { bar, line, pie, doughnut }
```

## AresPresentationComment

`package:ares_office_core/src/office_presentation_comments.dart`

```dart
class AresPresentationComment
const AresPresentationComment({required this.partPath, required this.slideIndex, required this.authorId, required this.index, required this.text, this.author, this.initials, this.modified, int x = 0, int y = 0, this.restriction, String? positionX, String? positionY});
final String partPath, authorId, index, text;
final int slideIndex;
int get x;
int get y;
String get positionX;
String get positionY;
final String? author, initials, restriction;
final DateTime? modified;
String get id;
bool get canEdit;
```

## AresPresentationCommentOperationResult

`package:ares_office_core/src/office_page_operations.dart`

```dart
class AresPresentationCommentOperationResult extends AresOfficePageOperationResult
const AresPresentationCommentOperationResult({required super.document, required super.activeIndex, required this.commentId, required this.snapshot});
final String commentId;
final AresPresentationCommentsSnapshot snapshot;
```

## AresPresentationComments

`package:ares_office_core/src/office_presentation_comments.dart`

```dart
class AresPresentationComments
static const dynamic minEditablePosition;
static const dynamic maxEditablePosition;
static void validatePosition(int x, int y);
static String canonicalPosition(String value);
static AresPresentationCommentsSnapshot inspect(Archive archive);
static AresPresentationComment addCoordinates(Archive archive, {required int slideIndex, required String text, required String author, String initials = '', String x = '0', String y = '0', DateTime? date});
static AresPresentationComment add(Archive archive, {required int slideIndex, required String text, required String author, String initials = '', int x = 0, int y = 0, DateTime? date});
static void duplicateSlideComments(Archive archive, int sourceIndex, int newIndex);
static void replaceText(Archive archive, AresPresentationComment target, String text, {DateTime? date});
static void move(Archive archive, AresPresentationComment target, {required int x, required int y, DateTime? date});
static void moveCoordinates(Archive archive, AresPresentationComment target, {required String x, required String y, DateTime? date});
static String removeSlideComments(Archive archive, int slideIndex);
static String removeAllComments(Archive archive);
static void remove(Archive archive, AresPresentationComment target);
```

## AresPresentationCommentsSnapshot

`package:ares_office_core/src/office_presentation_comments.dart`

```dart
class AresPresentationCommentsSnapshot
const AresPresentationCommentsSnapshot({required this.comments, this.restriction, this.sourceFingerprint});
final List<AresPresentationComment> comments;
final String? restriction, sourceFingerprint;
String? get creationRestriction;
bool get canCreate;
AresPresentationCommentsSnapshot withSourceFingerprint(String? value);
```

## AresPresentationCustomShow

`package:ares_office_core/src/office_document.dart`

```dart
class AresPresentationCustomShow
AresPresentationCustomShow({required this.id, required this.name, required List<int> slides});
final int id;
final String name;
final List<int> slides;
```

## AresPresentationDescription

`package:ares_office_core/src/office_presentation_accessibility.dart`

```dart
class AresPresentationDescription
const AresPresentationDescription({required this.slide, required this.id, required this.name, required this.kind, required this.description, required this.decorative, required this.needsDescription});
final int slide, id;
final String name, kind, description;
final bool decorative;
final bool needsDescription;
```

## AresPresentationEditing

`package:ares_office_core/src/office_presentation_editing.dart`

```dart
class AresPresentationEditing
static ({String source, int replacements, List<String> fragments}) replaceText(String source, RegExp expression, String replacement);
static bool showsMasterGraphics(String source);
static String setMasterGraphics(String source, bool visible);
static bool isSlideHidden(String source);
static String setSlideHidden(String source, bool hidden);
static List<AresSlideObject> objects(String source);
static List<String> objectParagraphTexts(String source, int id);
static List<int> objectParagraphLevels(String source, int id);
static String setTextListStyle(String source, int id, int start, int end, {required String? kind, String bulletCharacter = '•', String numberingScheme = 'arabicPeriod', int startAt = 1});
static String setTextHighlight(String source, int id, int start, int end, int colorArgb);
static String setObjectParagraphLevels(String source, int id, List<int> levels);
static String copyObjectFormatting(String source, int sourceId, int targetId);
static String text(String source);
static String changeTextCase(String source, String mode);
static String clearTextFormatting(String source);
static String synchronizeText(String source, String text, String title);
static String notesXml(String? source, String text, {String? presentationNamespaceUri});
static String readNotes(String source);
static String arrangeObjects(String source, Iterable<int> ids, String operation);
static String duplicateObject(String source, int id);
static String flipObject(String source, int id, {required bool horizontal});
static String updateObject(String source, int id, {double? x, double? y, double? width, double? height, double? rotation, String? text});
static List<List<String>> tableCells(String source, int id);
static String updateTable(String source, int id, List<List<String>> cells);
static String addTable(String source, List<List<String>> cells, {double x = 36, double y = 108, double width = 600, double height = 180});
static String? objectGeometry(String source, int id);
static const Map<String, String> shapePresets;
static const Map<String, String> showActionLabels;
static String? objectAction(String source, int id, {bool mouseOver = false});
static String setObjectAction(String source, int id, String? action, {bool mouseOver = false});
static String changeObjectGeometry(String source, int id, String geometry);
static String addObject(String source, {required String text, String geometry = 'textBox'});
static String deleteObject(String source, int id);
static String reorderObject(String source, int id, {required bool front});
static String reorderObjects(String source, List<int> orderedIds);
static String background(String source, int color);
static String patternBackground(String source, {required String preset, required int foreground, required int background});
static String transitionDirection(String source, String direction);
static int? advanceMilliseconds(String source);
static String advanceTiming(String source, int? milliseconds);
static int transitionMilliseconds(String source);
static String transitionDuration(String source, int milliseconds);
static String transitionSpeed(String source, String speed);
static String copyTransition(String destination, String source);
static String transition(String source, String effect);
```

## AresPresentationElement

`package:ares_office_core/src/presentation_file_preview.dart`

```dart
sealed class AresPresentationElement
final String alternativeText;
const AresPresentationElement({this.alternativeText = '', this.id = -1, required this.x, required this.y, required this.width, required this.height, required this.rotation});
final int id;
final double x;
final double y;
final double width;
final double height;
final double rotation;
```

## AresPresentationFreeform

`package:ares_office_core/src/office_presentation_freeform.dart`

```dart
class AresPresentationFreeform
static XmlElement geometry(AresFreeformPath path);
static String set(String source, int objectId, AresFreeformPath path);
static String add(String source, AresFreeformPath path, {String text = '', double x = 72, double y = 72, double width = 240, double height = 180});
static AresFreeformPath? read(String source, int objectId);
```

## AresPresentationGlow

`package:ares_office_core/src/presentation_file_preview.dart`

```dart
class AresPresentationGlow
const AresPresentationGlow({required this.color, required this.opacity, required this.radius});
final Color color;
final double opacity, radius;
```

## AresPresentationGroup

`package:ares_office_core/src/presentation_file_preview.dart`

```dart
class AresPresentationGroup extends AresPresentationElement
const AresPresentationGroup({super.id, super.alternativeText, required super.x, required super.y, required super.width, required super.height, required super.rotation, required this.childX, required this.childY, required this.childWidth, required this.childHeight, required this.elements, this.flipHorizontal = false, this.flipVertical = false});
final double childX, childY, childWidth, childHeight;
final bool flipHorizontal, flipVertical;
final List<AresPresentationElement> elements;
```

## AresPresentationHyperlinkIssue

`package:ares_office_core/src/office_presentation_accessibility.dart`

```dart
class AresPresentationHyperlinkIssue
const AresPresentationHyperlinkIssue({required this.slide, required this.index, required this.objectId, required this.text, required this.reason});
final int slide;
final int index;
final int objectId;
final String text;
final String reason;
```

## AresPresentationImage

`package:ares_office_core/src/presentation_file_preview.dart`

```dart
class AresPresentationImage extends AresPresentationElement
const AresPresentationImage({this.lineDash = const [], this.lineCap = StrokeCap.butt, this.lineColor, this.lineWidth = 0, this.crop = const Rect.fromLTRB(0, 0, 1, 1), this.brightness = 0, this.contrast = 0, this.transparency = 0, this.grayscale = false, this.decorative = false, this.shadow, this.glow, this.audio, this.video, this.playback = const AresPresentationMediaPlayback(), super.id, super.alternativeText, this.flipHorizontal = false, this.flipVertical = false, required super.x, required super.y, required super.width, required super.height, required super.rotation, required this.geometry, required this.bytes});
final Color? lineColor;
final double lineWidth;
final List<double> lineDash;
final StrokeCap lineCap;
final Rect crop;
final int brightness, contrast, transparency;
final bool grayscale;
final bool decorative;
final AresPresentationOuterShadow? shadow;
final AresPresentationGlow? glow;
final AresPresentationSound? audio;
final AresPresentationSound? video;
final AresPresentationMediaPlayback playback;
final bool flipHorizontal, flipVertical;
final String geometry;
final Uint8List bytes;
```

## AresPresentationLayout

`package:ares_office_core/src/presentation_file_preview.dart`

```dart
class AresPresentationLayout
const AresPresentationLayout({required this.width, required this.height, required this.slides});
final double width;
final double height;
final List<AresPresentationSlide> slides;
```

## AresPresentationMediaBookmark

`package:ares_office_core/src/office_presentation_media_playback.dart`

```dart
class AresPresentationMediaBookmark
const AresPresentationMediaBookmark({required this.name, required this.timeMilliseconds});
final String name;
final int timeMilliseconds;
AresPresentationMediaBookmark copyWith({String? name, int? timeMilliseconds});
```

## AresPresentationMediaPlayback

`package:ares_office_core/src/office_presentation_media_playback.dart`

```dart
class AresPresentationMediaPlayback
const AresPresentationMediaPlayback({this.start = 'whenClicked', this.loop = false, this.rewind = true, this.showWhenStopped = true, this.fullScreen = false, this.volume = 100, this.slides = 1, this.timelineIndex = -1, this.trimStartMilliseconds = 0, this.trimEndMilliseconds = 0, this.fadeInMilliseconds = 0, this.fadeOutMilliseconds = 0, this.bookmarks = const <AresPresentationMediaBookmark>[]});
final String start;
final bool loop, rewind, showWhenStopped, fullScreen;
final int volume, slides, timelineIndex, trimStartMilliseconds, trimEndMilliseconds, fadeInMilliseconds, fadeOutMilliseconds;
final List<AresPresentationMediaBookmark> bookmarks;
static const String media2010Namespace;
static const Set<String> starts;
AresPresentationMediaPlayback copyWith({String? start, bool? loop, bool? rewind, bool? showWhenStopped, bool? fullScreen, int? volume, int? slides, int? timelineIndex, int? trimStartMilliseconds, int? trimEndMilliseconds, int? fadeInMilliseconds, int? fadeOutMilliseconds, List<AresPresentationMediaBookmark>? bookmarks});
static AresPresentationMediaPlayback read(XmlNode source, int objectId);
static String apply(String source, int objectId, AresPresentationMediaPlayback value);
```

## AresPresentationOuterShadow

`package:ares_office_core/src/presentation_file_preview.dart`

```dart
class AresPresentationOuterShadow
const AresPresentationOuterShadow({required this.color, required this.opacity, required this.blurRadius, required this.distance, required this.angle});
final Color color;
final double opacity, blurRadius, distance, angle;
```

## AresPresentationParagraph

`package:ares_office_core/src/presentation_file_preview.dart`

```dart
class AresPresentationParagraph
const AresPresentationParagraph({required this.runs, required this.alignment, this.bulletText, this.textDirection = TextDirection.ltr, this.spaceBeforePoints = 0, this.spaceAfterPoints = 0, this.lineSpacing = 1.05, this.leftIndentPoints = 0, this.rightIndentPoints = 0, this.firstLineIndentPoints = 0});
final List<AresPresentationTextRun> runs;
final TextAlign alignment;
final String? bulletText;
final TextDirection textDirection;
final double spaceBeforePoints;
final double spaceAfterPoints;
final double lineSpacing;
final double leftIndentPoints;
final double rightIndentPoints;
final double firstLineIndentPoints;
```

## AresPresentationParser

`package:ares_office_core/src/presentation_file_preview.dart`

```dart
class AresPresentationParser
const AresPresentationParser();
Future<AresPresentationLayout> parse(File file, {List<AresOfficeDocumentSection>? editedSections, List<AresSlideChartChange> chartChanges = const [], List<AresPresentationThemeChange> themeChanges = const [], List<AresPresentationPartChange> partChanges = const [], int? slideWidthEmu, int? slideHeightEmu, int? maximumSlides});
Future<AresPresentationLayout> parseBytes(Uint8List bytes, {List<AresOfficeDocumentSection>? editedSections, List<AresSlideChartChange> chartChanges = const [], List<AresPresentationThemeChange> themeChanges = const [], List<AresPresentationPartChange> partChanges = const [], int? slideWidthEmu, int? slideHeightEmu, int? maximumSlides});
```

## AresPresentationPartChange

`package:ares_office_core/src/office_document.dart`

```dart
class AresPresentationPartChange
const AresPresentationPartChange({required this.id, required this.path, required this.sourceXml});
final String id, path, sourceXml;
```

## AresPresentationPictureFill

`package:ares_office_core/src/presentation_file_preview.dart`

```dart
class AresPresentationPictureFill
const AresPresentationPictureFill({required this.bytes, this.tile = false, this.crop = const Rect.fromLTRB(0, 0, 1, 1), this.offsetX = 0, this.offsetY = 0, this.scaleX = 1, this.scaleY = 1, this.alignment = 'tl', this.flip = 'none', this.rotateWithShape = true});
final Uint8List bytes;
final bool tile, rotateWithShape;
final Rect crop;
final double offsetX, offsetY, scaleX, scaleY;
final String alignment, flip;
```

## AresPresentationReflection

`package:ares_office_core/src/presentation_file_preview.dart`

```dart
class AresPresentationReflection
const AresPresentationReflection({required this.startOpacity, required this.endOpacity, required this.visibleFraction, required this.blurRadius, required this.distance, this.startPosition = 0, this.direction = 90, this.fadeDirection = 90, this.scaleX = 1, this.scaleY = -1, this.skewX = 0, this.skewY = 0, this.alignment = 'bl', this.rotateWithShape = false});
final double startOpacity, endOpacity, visibleFraction;
final double blurRadius, distance;
final double startPosition, direction, fadeDirection;
final double scaleX, scaleY, skewX, skewY;
final String alignment;
final bool rotateWithShape;
```

## AresPresentationShape

`package:ares_office_core/src/presentation_file_preview.dart`

```dart
class AresPresentationShape extends AresPresentationElement
const AresPresentationShape({this.action, this.hoverAction, this.customPaths = const [], this.geometryAdjustments = const <double>[], this.fillGradient, this.fillPattern, this.fillPatternBackground, this.pictureFill, this.shadow, this.innerShadow, this.glow, this.reflection, this.softEdgeRadius = 0, this.topBevel, this.bottomBevel, this.threeDFormat, this.lineDash = const [], this.lineCap = StrokeCap.butt, this.startArrow = const AresLineEnd(), this.endArrow = const AresLineEnd(), this.flipHorizontal = false, this.flipVertical = false, this.tableBorders, super.id, super.alternativeText, required super.x, required super.y, required super.width, required super.height, required super.rotation, required this.geometry, required this.fill, required this.lineColor, required this.lineWidth, required this.paragraphs, this.textOrientation = 'horz', this.textTransform = 'textNoShape', this.autofit = AresPresentationAutofit.none, this.autofitFontScale = 1, this.autofitLineSpacingReduction = 0, this.wrapText = true, this.horizontalOverflow = 'overflow', this.verticalOverflow = 'overflow', required this.verticalAlignment, required this.insetLeft, required this.insetRight, required this.insetTop, required this.insetBottom});
final List<AresDrawingPath> customPaths;
final String? action, hoverAction;
final List<double> geometryAdjustments;
final AresLinearGradientFill? fillGradient;
final String? fillPattern;
final Color? fillPatternBackground;
final AresPresentationPictureFill? pictureFill;
final AresPresentationOuterShadow? shadow;
final AresPresentationOuterShadow? innerShadow;
final AresPresentationGlow? glow;
final AresPresentationReflection? reflection;
final double softEdgeRadius;
final AresPresentationBevel? topBevel, bottomBevel;
final AresPresentationThreeDFormat? threeDFormat;
final List<double> lineDash;
final StrokeCap lineCap;
final AresLineEnd startArrow, endArrow;
final Border? tableBorders;
final bool flipHorizontal, flipVertical;
final String geometry;
final Color? fill;
final Color? lineColor;
final double lineWidth;
final List<AresPresentationParagraph> paragraphs;
final String textOrientation;
final String textTransform;
final AresPresentationAutofit autofit;
final double autofitFontScale;
final double autofitLineSpacingReduction;
final bool wrapText;
final String horizontalOverflow;
final String verticalOverflow;
final Alignment verticalAlignment;
final double insetLeft;
final double insetRight;
final double insetTop;
final double insetBottom;
```

## AresPresentationShowSettings

`package:ares_office_core/src/office_document.dart`

```dart
class AresPresentationShowSettings
const AresPresentationShowSettings({this.type = AresPresentationShowType.speaker, this.loop = false, this.showNarration = true, this.showAnimation = true, this.useTimings = true, this.showScrollbar = true, this.startSlide, this.endSlide, this.customShowId});
final AresPresentationShowType type;
final bool loop, showNarration, showAnimation, useTimings, showScrollbar;
final int? startSlide, endSlide;
final int? customShowId;
bool get usesRange;
AresPresentationShowSettings copyWith({AresPresentationShowType? type, bool? loop, bool? showNarration, bool? showAnimation, bool? useTimings, bool? showScrollbar, int? startSlide, int? endSlide, int? customShowId, bool clearRange = false, bool clearCustomShow = false});
bool ==(Object other);
int get hashCode;
```

## AresPresentationShowType

`package:ares_office_core/src/office_document.dart`

```dart
enum AresPresentationShowType { speaker, individual, kiosk }
```

## AresPresentationSlide

`package:ares_office_core/src/presentation_file_preview.dart`

```dart
class AresPresentationSlide
final List<AresSlideAnimation> animations;
const AresPresentationSlide({this.hidden = false, this.backgroundGradient, this.backgroundPicture, this.backgroundPattern, this.backgroundPatternForeground, this.backgroundPatternBackground, this.animations = const [], this.sounds = const <String, AresPresentationSound>{}, required this.path, required this.background, required this.elements, this.notes = '', this.transition = 'none', this.transitionSoundRelationshipId, this.transitionSoundLoop = false, this.transitionStopsSound = false, this.advanceMilliseconds, this.transitionMilliseconds = 500, this.transitionDirection = 'l'});
final bool hidden;
final Map<String, AresPresentationSound> sounds;
final AresLinearGradientFill? backgroundGradient;
final AresPresentationPictureFill? backgroundPicture;
final String? backgroundPattern;
final Color? backgroundPatternForeground, backgroundPatternBackground;
final String path;
final Color background;
final List<AresPresentationElement> elements;
final String notes;
final String transition;
final String? transitionSoundRelationshipId;
final bool transitionSoundLoop, transitionStopsSound;
final int? advanceMilliseconds;
final int transitionMilliseconds;
final String transitionDirection;
```

## AresPresentationSlideSection

`package:ares_office_core/src/office_document.dart`

```dart
class AresPresentationSlideSection
const AresPresentationSlideSection({required this.id, required this.name, required this.slides});
final String id, name;
final List<int> slides;
```

## AresPresentationSlideTitle

`package:ares_office_core/src/office_presentation_accessibility.dart`

```dart
class AresPresentationSlideTitle
const AresPresentationSlideTitle({required this.slide, required this.title, required this.missing, required this.duplicate});
final int slide;
final String title;
final bool missing;
final bool duplicate;
bool get hasIssue;
```

## AresPresentationSnapshot

`package:ares_office_core/src/presentation_file_preview.dart`

```dart
class AresPresentationSnapshot extends StatelessWidget
const AresPresentationSnapshot({super.key, required this.layout});
final AresPresentationLayout layout;
Widget build(BuildContext context);
```

## AresPresentationSound

`package:ares_office_core/src/presentation_file_preview.dart`

```dart
class AresPresentationSound
const AresPresentationSound({required this.name, required this.extension, required this.bytes});
final String name, extension;
final Uint8List bytes;
```

## AresPresentationTable

`package:ares_office_core/src/presentation_file_preview.dart`

```dart
class AresPresentationTable extends AresPresentationElement
const AresPresentationTable({super.id, super.alternativeText, required super.x, required super.y, required super.width, required super.height, required super.rotation, required this.cells});
final List<AresPresentationShape> cells;
```

## AresPresentationTextRun

`package:ares_office_core/src/presentation_file_preview.dart`

```dart
class AresPresentationTextRun
const AresPresentationTextRun({required this.text, this.fontSize = 18, this.fontFamily = 'Aptos', this.color = const Color(0xff17212b), this.fillGradient, this.fillPattern, this.fillPatternBackground, this.bold = false, this.italic = false, this.underline = false, this.strikethrough = false, this.textPosition = AresOfficeTextPosition.normal, this.highlightColor, this.capitalization = 'none', this.characterSpacing = 0, this.outlineColor, this.outlineWidth = 0, this.outlineDash = const <double>[], this.outlineCap = StrokeCap.butt, this.outlineJoin = 'round', this.glow, this.shadow, this.reflection});
final String text;
final double fontSize;
final String fontFamily;
final Color color;
final AresLinearGradientFill? fillGradient;
final String? fillPattern;
final Color? fillPatternBackground;
final bool bold;
final bool italic;
final bool underline;
final bool strikethrough;
final AresOfficeTextPosition textPosition;
final Color? highlightColor;
final String capitalization;
final double characterSpacing;
final Color? outlineColor;
final double outlineWidth;
final List<double> outlineDash;
final StrokeCap outlineCap;
final String outlineJoin;
final AresPresentationGlow? glow;
final AresPresentationOuterShadow? shadow;
final AresPresentationReflection? reflection;
```

## AresPresentationThemeChange

`package:ares_office_core/src/office_document.dart`

```dart
class AresPresentationThemeChange
AresPresentationThemeChange({required this.id, required this.name, required Map<String, String> colors, this.headingFont, this.bodyFont});
final String id, name;
final Map<String, String> colors;
final String? headingFont, bodyFont;
```

## AresPresentationThreeDFormat

`package:ares_office_core/src/presentation_file_preview.dart`

```dart
class AresPresentationThreeDFormat
const AresPresentationThreeDFormat({required this.depth, required this.depthColor, required this.contourWidth, required this.contourColor, required this.material, required this.cameraPreset, required this.rotationX, required this.rotationY, required this.rotationZ, required this.perspective, required this.lightRig, required this.lightDirection});
final double depth, contourWidth;
final Color? depthColor, contourColor;
final String material;
final String cameraPreset, lightRig, lightDirection;
final double rotationX, rotationY, rotationZ, perspective;
```

## AresScanRegion

`package:ares_office_core/src/scanner/ares_powerpoint_scan.dart`

```dart
class AresScanRegion
const AresScanRegion({required this.id, required this.kind, required this.bounds, this.text = '', this.imagePng, this.confidence, this.reviewed = false});
final String id;
final AresScanRegionKind kind;
final Rect bounds;
final String text;
final Uint8List? imagePng;
final double? confidence;
final bool reviewed;
Map<String, Object?> toJson();
factory AresScanRegion.fromJson(Map<String, dynamic> json);
```

## AresScanRegionKind

`package:ares_office_core/src/scanner/ares_powerpoint_scan.dart`

```dart
enum AresScanRegionKind { heading, text, image, table, chart, shape, connector }
```

## AresSlideAnimation

`package:ares_office_core/src/office_presentation_animations.dart`

```dart
class AresSlideAnimation
const AresSlideAnimation({required this.id, required this.objectId, required this.effect, this.exit = false, this.direction = 'left', this.duration = 500, this.delay = 0, this.repeatCount = 1, this.autoReverse = false, this.rewind = false, this.motionPath = 'M 0 0 L 0.25 0 E', this.motionPathEditMode = 'relative', this.motionOrigin = 'layout', this.motionPointTypes = '', this.textSequence = 'all', this.textDelayPercent = 10, this.textSequenceReverse = false, this.scalePercent = 150, this.colorRgb = 0xff0000, this.transparencyPercent = 50, this.fontFamily = 'Arial', this.triggerObjectId, this.triggerMediaObjectId, this.triggerBookmarkName, this.start = 'click', this.soundRelationshipId, this.soundName = '', this.soundVolume = 100, this.stopPreviousSound = false, this.timelineIndex = -1});
final int id, objectId, duration, delay, repeatCount, textDelayPercent, scalePercent, colorRgb, transparencyPercent;
final int timelineIndex;
final int? triggerObjectId;
final int? triggerMediaObjectId;
final String effect, direction, motionPath, motionPathEditMode, motionOrigin, motionPointTypes, textSequence, start, fontFamily, soundName;
final String? triggerBookmarkName;
final String? soundRelationshipId;
final int soundVolume;
final bool exit, autoReverse, rewind, textSequenceReverse, stopPreviousSound;
String get label;
```

## AresSlideChartChange

`package:ares_office_core/src/office_document.dart`

```dart
class AresSlideChartChange
AresSlideChartChange({required this.id, required this.sectionIndex, required this.relationshipId, required this.title, required this.line, this.kind, this.firstSliceAngle = 0, this.holeSize = 50, this.showLegend = true, this.showValues, this.showPercent, required List<List<String>> rows});
final String id, relationshipId, title;
final int sectionIndex;
final bool line;
final AresSlideChartKind? kind;
final int firstSliceAngle, holeSize;
final bool showLegend;
final bool? showValues, showPercent;
AresSlideChartKind get effectiveKind;
final List<List<String>> rows;
```

## AresSlideChartKind

`package:ares_office_core/src/office_document.dart`

```dart
enum AresSlideChartKind { column, line, pie, doughnut, bar, stackedColumn, stackedBar, percentColumn, percentBar }
```

## AresSlideObject

`package:ares_office_core/src/office_presentation_editing.dart`

```dart
class AresSlideObject
const AresSlideObject({required this.id, required this.name, required this.kind, required this.x, required this.y, required this.width, required this.height, required this.rotation, required this.text});
final int id;
final String name, kind, text;
final double x, y, width, height, rotation;
```

## AresSlidePlan

`package:ares_office_core/src/scanner/ares_powerpoint_scan.dart`

```dart
class AresSlidePlan
AresSlidePlan({required this.scan, required this.templateId, required this.transformation, required List<AresScanRegion> elements, this.warnings = const []});
final AresStructuredScan scan;
final String templateId;
final AresPowerPointTransformation transformation;
final List<AresScanRegion> elements;
final List<String> warnings;
Map<String, Object?> toJson();
factory AresSlidePlan.fromJson(Map<String, dynamic> json);
AresOfficeRecognizedPage toPage();
```

## AresSlideReuseFormatting

`package:ares_office_core/src/office_presentation_import.dart`

```dart
enum AresSlideReuseFormatting { source, destinationTheme }
```

## AresStructuredScan

`package:ares_office_core/src/scanner/ares_powerpoint_scan.dart`

```dart
class AresStructuredScan
AresStructuredScan({required this.originalPath, required this.processedPath, required List<AresScanRegion> regions, this.aspectRatio = 1, this.mode = AresPowerPointScanMode.document});
final String originalPath, processedPath;
final double aspectRatio;
final AresPowerPointScanMode mode;
final List<AresScanRegion> regions;
Map<String, Object?> toJson();
factory AresStructuredScan.fromJson(Map<String, dynamic> json);
factory AresStructuredScan.fromPage(AresOfficeRecognizedPage page, {required String originalPath, required String processedPath});
```

## AresWordCommentCreationResult

`package:ares_office_core/src/office_page_operations.dart`

```dart
class AresWordCommentCreationResult extends AresWordCommentOperationResult
const AresWordCommentCreationResult({required super.document, required super.activeIndex, required super.commentId, required super.snapshot});
```

## AresWordCommentOperationResult

`package:ares_office_core/src/office_page_operations.dart`

```dart
class AresWordCommentOperationResult extends AresOfficePageOperationResult
const AresWordCommentOperationResult({required super.document, required super.activeIndex, required this.commentId, required this.snapshot});
final String commentId;
final AresWordCommentsSnapshot snapshot;
```

## AresWordHeaderFooterChange

`package:ares_office_core/src/office_document.dart`

```dart
class AresWordHeaderFooterChange
const AresWordHeaderFooterChange({required this.id, required this.kind, this.variant = AresWordHeaderFooterVariant.defaultPages, this.text, this.textAlignment, this.textBold, this.textItalic, this.textUnderline, this.textFontSize, this.pageNumber, this.pageNumberAlignment = AresWordPageNumberAlignment.center, this.pageNumberFormat, this.pageNumberStart});
final String id;
final AresWordHeaderFooterKind kind;
final AresWordHeaderFooterVariant variant;
final String? text;
final AresWordPageNumberAlignment? textAlignment;
final bool? textBold;
final bool? textItalic;
final bool? textUnderline;
final double? textFontSize;
final bool? pageNumber;
final AresWordPageNumberAlignment pageNumberAlignment;
final AresWordPageNumberFormat? pageNumberFormat;
final int? pageNumberStart;
```

## AresWordHeaderFooterKind

`package:ares_office_core/src/office_document.dart`

```dart
enum AresWordHeaderFooterKind { header, footer }
```

## AresWordHeaderFooterVariant

`package:ares_office_core/src/office_document.dart`

```dart
enum AresWordHeaderFooterVariant { defaultPages, firstPage, evenPages }
```

## AresWordPageNumberAlignment

`package:ares_office_core/src/office_document.dart`

```dart
enum AresWordPageNumberAlignment { left, center, right }
```

## AresWordPageNumberFormat

`package:ares_office_core/src/office_document.dart`

```dart
enum AresWordPageNumberFormat { decimal, lowerRoman, upperRoman, lowerLetter, upperLetter }
```

## AresWordTabAlignment

`package:ares_office_core/src/office_document.dart`

```dart
enum AresWordTabAlignment { left, center, right, decimal, bar }
```

## AresWordTabLeader

`package:ares_office_core/src/office_document.dart`

```dart
enum AresWordTabLeader { none, dot, hyphen, underscore, heavy, middleDot }
```

## AresWordTabStop

`package:ares_office_core/src/office_document.dart`

```dart
class AresWordTabStop
const AresWordTabStop({required this.positionPoints, this.alignment = AresWordTabAlignment.left, this.leader = AresWordTabLeader.none});
final double positionPoints;
final AresWordTabAlignment alignment;
final AresWordTabLeader leader;
```

## AresWordTableStylePreset

`package:ares_office_core/src/office_document.dart`

```dart
enum AresWordTableStylePreset { plain, grid, header, bandedRows }
```

## EdgeDetectionScannerMode

`package:ares_defence_labs_embedded_edge_detection/edgeTypes.dart`

```dart
enum EdgeDetectionScannerMode { LowResFast, Balanced, UltraDetailed }
```

## ExtractedOfficeImage

`package:ares_office_core/src/office_embedded_image_extractor.dart`

```dart
class ExtractedOfficeImage
const ExtractedOfficeImage({required this.path, required this.packagePath, required this.bytes});
final String path;
final String packagePath;
final int bytes;
```

## FileType

`package:ares_office_core/src/file_type_detector.dart`

```dart
enum FileType { image, video, word, excel, csv, powerpoint, text, md }
```
