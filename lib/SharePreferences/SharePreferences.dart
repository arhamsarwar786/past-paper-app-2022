


import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SavedPreferences{

  

  static savePdf(List pdfList)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("pdfs", jsonEncode(pdfList));
  }


  static getPdf()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    var data  = pref.getString("pdfs");
    if(data == null){
      return null;
    }else{
      return jsonDecode(data);
    }

  }


  static clearPreferences()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }
}