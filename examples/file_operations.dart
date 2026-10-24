import 'package:ares_powerpoint/ares_powerpoint.dart';

Future<AresOfficeSaveResult> updateAresPowerPoint(
  AresPowerPointSdk sdk, String path, String copyPath,
) async {
  final original = await sdk.load(path);
  final session = await sdk.edit(original);
  try {
    // Use a supported editable fixture containing at least one section.
    session.setSpeakerNotes(0, 'Presenter notes for the opening slide.');
    return await sdk.save(session, outputPath: copyPath);
  } finally {
    session.dispose();
  }
}
