// Track the progress of a downloaded file here.
import 'dart:io';
import 'package:book_app/SharePreferences/SharePreferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class MyProvider extends ChangeNotifier { 


  var downloadedPdfs;
  double progress = 0;

  // Track if the PDF was downloaded here.
  bool didDownloadPDF = false;

  // Show the progress status to the user.
  String progressString = 'File has not been downloaded yet.';

  // This method uses Dio to download a file from the given URL
  // and saves the file to the provided `savePath`.
  Future download(Dio dio, String url, String savePath,String fileName) async {
    try {
      Response response = await dio.get(
        url,
        onReceiveProgress: updateProgress,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
      );
      var file = File('$savePath/$fileName.pdf').openSync(mode: FileMode.write);
      file.writeFromSync(response.data);
      await file.close();
       if (progress >= 1 && didDownloadPDF) {
        savingDownloadedPdfs( fileName,file.path);
      }

      // Here, you're catching an error and printing it. For production
      // apps, you should display the warning to the user and give them a
      // way to restart the download.
    } catch (e) {
      print(e);
    }
  }

  // You can update the download progress here so that the user is
  // aware of the long-running task.
  void updateProgress(done, total) {
    progress = done / total;
      if (progress >= 1) {
        progressString =
            '✅ File has finished downloading. Try opening the file.';
        didDownloadPDF = true;
      } else {
        
        progressString = 'Download progress: ' +
            (progress * 100).toStringAsFixed(0) +
            '% done.';
      }
      print(progress);
      notifyListeners();
    // setState(() {
    // });
  }




  savingDownloadedPdfs(String paperName,String pdfPath)async{
      var savedPdfList =  await SavedPreferences.getPdf();
      if(savedPdfList == null){
          var createList = [];
          createList.add({paperName:pdfPath});
          SavedPreferences.savePdf(createList);
      }else{
        savedPdfList.add({paperName:pdfPath});
        SavedPreferences.savePdf(savedPdfList);
      }
  }


  fetchPdfs()async{
    var savedPdfList =  await SavedPreferences.getPdf();
    if (savedPdfList == null) {
      downloadedPdfs =  null;
    }else{
      downloadedPdfs =  savedPdfList;
    }
    notifyListeners();
  }

}
