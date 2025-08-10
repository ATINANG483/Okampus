import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerScreen extends StatelessWidget {
  final String? assetPath;
  final String? pdfUrl;
  final String titre;

  const PdfViewerScreen({
    Key? key,
    this.assetPath,
    this.pdfUrl,
    required this.titre,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget pdfWidget;

    if (assetPath != null) {
      pdfWidget = SfPdfViewer.asset(assetPath!);
    } else if (pdfUrl != null) {
      pdfWidget = SfPdfViewer.network(pdfUrl!);
    } else {
      pdfWidget = const Center(child: Text('Aucun PDF à afficher'));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(titre),
      ),
      body: pdfWidget,
    );
  }
}
