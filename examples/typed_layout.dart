import 'package:ares_powerpoint/ares_powerpoint.dart';
import 'package:ares_powerpoint/storage.dart';

Future<AresPresentationLayout> readImportedLayout(
  AresPowerPointSdk sdk, List<int> bytes, {String? nativePath}
) async {
  // Native hosts supply an absolute writable path; web can omit it.
  final handle = await AresOfficeStorage.importBytes(
    name: 'document.pptx', bytes: bytes, path: nativePath,
  );
  // A persisted browser handle is restored automatically when necessary.
  return sdk.loadLayout(handle);
}
