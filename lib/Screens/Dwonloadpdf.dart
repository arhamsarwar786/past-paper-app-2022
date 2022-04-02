// import 'package:advance_pdf_viewer_fork/advance_pdf_viewer_fork.dart';
// import 'package:book_app/Const.dart';
// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:path_provider/path_provider.dart';

// class DownloadFile extends StatefulWidget {
//   @override
//   State createState() {
//     return _DownloadFileState();
//   }
// }

// class _DownloadFileState extends State {
//   var pdfUrl =
//       "https://africau.edu/images/default/sample.pdf?msclkid=5425295dab6a11ecb584c29da3aca21e.pdf";
//   bool downloading = true;
//   String downloadingStr = "No data";
//   String savePath = "";

//   @override
//   void initState() {
//     super.initState();
//     downloadFile();
//   }

//   Future downloadFile() async {
//     try {
//       Dio dio = Dio();

//       String fileName = pdfUrl.substring(pdfUrl.lastIndexOf("/") + 1);

//       savePath = await getFilePath(fileName);
//       await dio.download(pdfUrl, savePath, onReceiveProgress: (rec, total) {
//         setState(() {
//           downloading = true;
//           // download = (rec / total) * 100;
//           downloadingStr = "Downloading Paper : $rec";
//         });
//       });
//       setState(() {
//         downloading = false;
//         downloadingStr = "Completed";
//       });
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   Future<String> getFilePath(uniqueFileName) async {
//     String path = '';

//     Directory dir = await getApplicationDocumentsDirectory();

//     path = '${dir.path}/$uniqueFileName';

//     return path;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(primaryColor: Colors.pink),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Download File"),
//           backgroundColor: Constant.primarycolor,
//         ),
//         body: Center(
//           child: downloading
//               ? Container(
//                   height: 250,
//                   width: 250,
//                   child: Card(
//                     color: Colors.pink,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         CircularProgressIndicator(
//                           backgroundColor: Colors.white,
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Text(
//                           downloadingStr,
//                           style: TextStyle(color: Colors.white),
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               : PDFViewer(document: )),
//         ),
//     );
//   }
// }
