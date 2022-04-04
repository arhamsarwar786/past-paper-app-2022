import 'dart:io';
import 'package:path_provider/path_provider.dart';

class PathProvider{
   static Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();    
    return directory.path;
  }

  // static Future<File> get getPdf async {
  //   final path = await localPath;
  //   return File('$path/counter.txt');
  // }


   static Future<File>  setPdf(pdfPath) async {
    final path = await localPath;
    return File('$path/$pdfPath');
  }
}