import 'package:book_app/Const.dart';
import 'package:flutter/material.dart';

import 'Book Selection.dart';
import 'PdfView.dart';

class YearSelect extends StatefulWidget {
  String? bookname;
  YearSelect([this.bookname]);

  @override
  _YearSelectState createState() => _YearSelectState();
}

class _YearSelectState extends State<YearSelect> {
  static const _year = [
    'Past Papers 2012',
    'Past Papers 2013',
    'Past Papers 2014',
    'Past Papers 2015',
    'Past Papers 2016',
    'Past Papers 2017',
    'Past Papers 2018',
    'Past Papers 2019',
    'Past Papers 2021',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Tooltip(
          message: 'Go Back',
          child: InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => BookSelection()));
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
      body: ListView.builder(
          itemCount: _year.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => Pdfview(widget.bookname)));
                },
                child: Card(
                  elevation: 10,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundColor: Constant.primarycolor,
                      child: Text(
                        "Y",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      _year[index],
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
              ),
            );
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
