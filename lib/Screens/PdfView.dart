import 'package:advance_pdf_viewer_fork/advance_pdf_viewer_fork.dart';
import 'package:book_app/Const.dart';
import 'package:flutter/material.dart';

class Pdfview extends StatefulWidget {
  String? BookN1;
  Pdfview(this.BookN1);
  @override
  _PdfviewState createState() => _PdfviewState();
}

class _PdfviewState extends State<Pdfview> {
  bool _isLoading = true;
  PDFDocument? _pdf;

  void _loadFile() async {
    // Load the pdf file from the internet
    _pdf = await PDFDocument.fromURL(
        'https://africau.edu/images/default/sample.pdf?msclkid=5425295dab6a11ecb584c29da3aca21e');

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Tooltip(
              message: 'Download',
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.download_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
        leading: Tooltip(
          message: 'GO BACK',
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Constant.primarycolor,
        centerTitle: true,
        title: Text(
          widget.BookN1!,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
          child: _isLoading
              ? Center(
                  child: CircularProgressIndicator(
                  color: Constant.primarycolor,
                ))
              : PDFViewer(document: _pdf!)),
    );
  }
}
