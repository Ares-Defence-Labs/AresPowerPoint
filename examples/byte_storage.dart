import 'package:ares_powerpoint/ares_powerpoint.dart';

// Native callers supply nativeDestination; browsers leave it null.
Future<List<int>> importEditExport(AresPowerPointSdk sdk, List<int> bytes,
    {String? nativeDestination}) async {
  final imported = await sdk.loadBytes(name: 'document.pptx', bytes: bytes,
    path: nativeDestination);
  final session = await sdk.edit(imported);
  try {
    session.setSpeakerNotes(0, 'Presenter notes for the opening slide.');
    final saved = await sdk.save(session);
    return await sdk.exportBytes(saved.document.path);
  } finally {
    session.dispose();
  }
}
