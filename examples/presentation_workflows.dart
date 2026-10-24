import 'package:ares_powerpoint/ares_powerpoint.dart';

// Requires a supported PPTX with at least one slide. File-level operations commit
// immediately; there must be no dirty editor/session for this path.
Future<AresOfficeDocument> arrangeDeck(AresPowerPointSdk sdk, String path) async {
  final original = await sdk.load(path);
  final added = await sdk.addSlide(path, afterIndex: 0,
    expectedSourceFingerprint: original.sourceFingerprint);
  final duplicated = await sdk.duplicateSlide(path, index: added.activeIndex,
    expectedSourceFingerprint: added.document.sourceFingerprint);
  final count = duplicated.document.sections.length;
  final reordered = await sdk.reorderSlides(path,
    order: List<int>.generate(count, (i) => count - 1 - i),
    expectedSourceFingerprint: duplicated.document.sourceFingerprint);
  return reordered.document;
}

Future<AresOfficeDocument> editSlide(AresPowerPointSdk sdk, String path) async {
  final session = await sdk.edit(await sdk.load(path));
  try {
    session.editPresentationXml(0, (xml) => AresPresentationEditing.addObject(
      xml, text: 'Project update', geometry: 'textBox'));
    session.setSpeakerNotes(0, 'Explain the next steps.');
    return (await sdk.save(session)).document;
  } finally {
    session.dispose();
  }
}

Future<AresOfficeDocument> reuseOpeningSlide(AresPowerPointSdk sdk,
    String path, String sourcePath) async {
  final target = await sdk.load(path);
  final source = await sdk.load(sourcePath);
  final result = await sdk.reuseSlides(path, sourcePath: sourcePath,
    slideIndexes: [0], afterIndex: 0, formatting: AresSlideReuseFormatting.source,
    expectedSourceFingerprint: target.sourceFingerprint,
    expectedImportFingerprint: source.sourceFingerprint);
  return result.document;
}

Future<void> reviewSlide(AresPowerPointSdk sdk, String path) async {
  final snapshot = await sdk.inspectComments(path);
  if (!snapshot.canCreate) return;
  final created = await sdk.addComment(path, slideIndex: 0,
    text: 'Check this slide.', author: 'Reviewer',
    expectedSourceFingerprint: snapshot.sourceFingerprint);
  final comments = created.snapshot.comments;
  final comment = comments.firstWhere((c) => c.id == created.commentId);
  if (!comment.canEdit) return;
  await sdk.replaceCommentText(path, comment, 'Slide reviewed.',
    expectedSourceFingerprint: created.document.sourceFingerprint);
}


Future<void> clearPresentationReview(AresPowerPointSdk sdk, String path) async {
  final snapshot = await sdk.inspectComments(path);
  if (snapshot.restriction != null || snapshot.comments.isEmpty ||
      snapshot.comments.any((c) => !c.canEdit)) return;
  // Confirm this presentation-wide deletion with the user first.
  await sdk.removeAllComments(path,
    expectedSourceFingerprint: snapshot.sourceFingerprint);
}

Future<void> clearSupportedSlideComments(AresPowerPointSdk sdk, String path, int slideIndex) async {
  final snapshot = await sdk.inspectComments(path);
  final targets = snapshot.comments.where((c) => c.slideIndex == slideIndex).toList();
  if (snapshot.restriction != null || targets.isEmpty || targets.any((c) => !c.canEdit)) return;
  // Confirm target/count with the user before this mutation.
  await sdk.removeSlideComments(path, slideIndex: slideIndex,
    expectedSourceFingerprint: snapshot.sourceFingerprint);
}

Future<void> moveFirstExactComment(AresPowerPointSdk sdk, String path) async {
  final inspected = await sdk.inspectComments(path);
  final comments = inspected.comments.where((c) => c.canEdit).toList();
  if (comments.isEmpty) return;
  await sdk.moveCommentCoordinates(path, comments.first,
    x: '9007199254740993', y: '-9007199254740993',
    expectedSourceFingerprint: inspected.sourceFingerprint);
}

Future<void> moveFirstLegacyComment(AresPowerPointSdk sdk, String path) async {
  final inspected = await sdk.inspectComments(path);
  if (inspected.comments.isEmpty || !inspected.comments.first.canEdit) return;
  await sdk.moveComment(path, inspected.comments.first, x: 146, y: -72,
    expectedSourceFingerprint: inspected.sourceFingerprint);
}

// Native shape IDs are obtained from the current slide, never guessed.
Future<AresOfficeDocument> repositionShape(AresPowerPointSdk sdk, String path) async {
  final session = await sdk.edit(await sdk.load(path));
  try {
    final xml = session.document.sections.first.sourceXml;
    if (xml == null) throw StateError('Native slide XML unavailable.');
    final shapes = AresPresentationEditing.objects(xml);
    if (shapes.isEmpty) throw StateError('Choose a slide with a supported object.');
    session.editPresentationXml(0, (source) => AresPresentationEditing.updateObject(
      source, shapes.first.id, x: 72, y: 72, width: 240, height: 100));
    return (await sdk.save(session)).document;
  } finally {
    session.dispose();
  }
}
