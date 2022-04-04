
import 'dart:io';

import 'package:advance_pdf_viewer_fork/advance_pdf_viewer_fork.dart';
import 'package:book_app/Const.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class PdfViewerOpener extends StatefulWidget {
  final pdfName, pdfPath;
  PdfViewerOpener(this.pdfName,this.pdfPath);




  @override
  State<PdfViewerOpener> createState() => _PdfViewerOpenerState();
}

class _PdfViewerOpenerState extends State<PdfViewerOpener> {
  var pdf;

  fetchPdf()async{
    pdf =await PDFDocument.fromFile(File(widget.pdfPath));    
    setState(() {
      
    });
  }



  @override
  void initState() {
    fetchPdf();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(widget.pdfName),
        centerTitle: true,
        backgroundColor: Constant.primarycolor,
      ),    
      body: pdf == null ? Center(child: CircularProgressIndicator.adaptive()) :  PDFViewer(document: pdf,),
    );
  }
}