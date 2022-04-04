import 'dart:io';

import 'package:advance_pdf_viewer_fork/advance_pdf_viewer_fork.dart';
import 'package:book_app/Const.dart';
import 'package:book_app/Path%20Manager/Download%20Manager/download.dart';
import 'package:book_app/Screens/pdf_viewer.dart';
import 'package:book_app/SharePreferences/SharePreferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Path Manager/pathProvider.dart';

class Pdfview extends StatefulWidget {
  final String? paperName;
  final QueryDocumentSnapshot data;
  Pdfview(this.paperName,this.data);
  @override
  _PdfviewState createState() => _PdfviewState();
}

class _PdfviewState extends State<Pdfview> {
  bool _isLoading = true;
  PDFDocument? _pdf;

  void _loadFile() async {
    // Load the pdf file from the internet
    _pdf = await PDFDocument.fromURL(
        '${widget.data.get("pdfPath")}');

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
              child: Stack(
                
                children: [

                  
                  IconButton(
                    onPressed: () async{
                      // /data/user/0/com.example.book_app/app_flutter
                      // print('${await PathProvider.localPath}/${widget.data.id}');

                      // var dic = Directory('${await PathProvider.localPath}/${widget.paperName!+widget.data.id}.pdf');

                      // print(await SavedPreferences.getPdf());

                      Provider.of<MyProvider>(context,listen: false).download(Dio(), widget.data.get("pdfPath"), await PathProvider.localPath,widget.paperName!+widget.data.id);
                    },
                    icon: const Icon(
                      Icons.download_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  
                  Positioned(
                    top: 0,
                    child: Consumer<MyProvider>(
                      builder: (context,provider,child) {
                        return (provider.progress >= 1 || provider.progress == 0) ? Container() : Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100)
                          ),
                          child: Text("${(provider.progress*100).round()}",style: TextStyle(color: Constant.primarycolor,fontSize: 10),),  
                        );
                      }
                    ),
                  ),
                ],
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
            child:const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Constant.primarycolor,
        centerTitle: true,
        title: Text(
          '${widget.paperName!} ${widget.data.id}',
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
