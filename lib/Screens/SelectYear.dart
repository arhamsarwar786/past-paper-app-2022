import 'package:book_app/Const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'Book Selection.dart';
import 'PdfView.dart';

class YearSelect extends StatefulWidget {
  String? bookname,className;
  YearSelect(this.bookname,this.className);

  @override
  _YearSelectState createState() => _YearSelectState();
}

class _YearSelectState extends State<YearSelect> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Tooltip(
          message: 'Go Back',
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
        centerTitle: true,
        backgroundColor: Constant.primarycolor,
        title: Text(
          '${widget.bookname == Null ? '' : widget.bookname}',
          style: Constant.myStyle,
        ),
      ),
      body:  StreamBuilder(
        stream: FirebaseFirestore.instance.collection("PastPapers").doc(widget.className).collection(widget.bookname!).snapshots(),
        builder: (context, AsyncSnapshot snapshot) {

          if(snapshot.hasData){
            QuerySnapshot data = snapshot.data;
              print(snapshot.data);
            
            return  ListView.builder(
              shrinkWrap: true,
          itemCount: data.docs.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                child: ListTile(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => Pdfview(widget.bookname,data.docs[index])));
                  },
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundColor: Constant.primarycolor,
                    child: Text(
                      "Y",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    "${widget.bookname} ${data.docs[index].id}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  // subtitle: Text("year 2015"),
                  trailing: Tooltip(
                    message: 'Download',
                    child: InkWell(
                        onTap: () {
                          showAlertDialog(context);
                        },
                        child: Icon(
                          Icons.download,
                          color: Colors.black,
                        )),
                  ),
                ),
              ),
            );
          });
          }

          return Center(child:CircularProgressIndicator.adaptive());
      }),
      
       );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = Container(
    margin: EdgeInsets.all(10),
    // height: 50.0,
    child: MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
      padding: EdgeInsets.all(10.0),
      color: Colors.black26,
      textColor: Colors.white,
      child: Text("Cancel", style: TextStyle(fontSize: 15)),
    ),
  );
  Widget okButton1 = Container(
    margin: EdgeInsets.all(10),
    // height: 50.0,
    child: MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      onPressed: () {},
      padding: EdgeInsets.all(10.0),
      color: Constant.primarycolor,
      textColor: Colors.white,
      child: Text("Download", style: TextStyle(fontSize: 15)),
    ),
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      "Download Paper",
      style: TextStyle(
          color: Constant.primarycolor,
          fontWeight: FontWeight.bold,
          fontSize: 20),
    ),
    content: Text("Are you really want to Download this paper?"),
    actions: [
      okButton,
      okButton1,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
