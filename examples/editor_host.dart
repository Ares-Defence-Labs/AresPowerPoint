import 'package:flutter/material.dart';
import 'package:ares_powerpoint/ares_powerpoint.dart';

class AresPowerPointHost extends StatefulWidget {
  const AresPowerPointHost({super.key, required this.sdk, required this.path});
  final AresPowerPointSdk sdk;
  final String path;
  @override
  State<AresPowerPointHost> createState() => _AresPowerPointHostState();
}

class _AresPowerPointHostState extends State<AresPowerPointHost> {
  final controller = AresOfficeViewerController();
  @override
  void dispose() {
    controller.dispose(); // Host owns this controller; widget owns its workspace.
    super.dispose();
  }
  @override
  Widget build(BuildContext context) => AresPowerPointEditor(
    sdk: widget.sdk,
    documentPath: widget.path,
    controller: controller,
    theme: ThemeData(colorSchemeSeed: const Color(0xff008577)),
    darkTheme: ThemeData.dark(),
    viewerConfig: const AresOfficeViewerConfig(
      allowEditing: true,
      initialZoom: 1,
      commentAuthorName: 'Reviewer',
    ),
    appBarConfig: const AresOfficeViewerAppBarConfig(title: 'AresPowerPoint workspace'),
    toolsSheetConfig: const AresOfficeToolsSheetConfig(showPrint: false),
    onDocumentReady: (document) { /* show document metadata in your app */ },
    onDocumentModified: () { /* reflect unsaved work */ },
    onDocumentSaved: (saved) { /* update current path from saved.document.path */ },
    onAutoSaved: (saved) { /* acknowledge successful persistence */ },
    onError: (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Unable to complete the document operation.')),
      );
    },
  );
}
