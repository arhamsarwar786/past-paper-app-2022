import 'package:book_app/Components/Drawer.dart';
import 'package:book_app/Const.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'Book Selection.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static const _class = [
    '9th',
    '10th',
    '11th',
    '12th',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Constant.primarycolor,
        title: Text(
          "PAST PAPERS",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => BookSelection()));
                  },
                  child: Card(
                    shadowColor: Colors.black,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.20,
                      width: MediaQuery.of(context).size.height * 0.20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Constant.primarycolor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: '9',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 75,
                                      fontWeight: FontWeight.w500)),
                              WidgetSpan(
                                child: Transform.translate(
                                  offset: const Offset(2, -25),
                                  child: Text(
                                    'th',
                                    //superscript is usually smaller in size
                                    textScaleFactor: 0.9,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  ),
                                ),
                              )
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  shadowColor: Colors.black,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.20,
                    width: MediaQuery.of(context).size.height * 0.20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Constant.primarycolor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: '10',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 65,
                                    fontWeight: FontWeight.w500)),
                            WidgetSpan(
                              child: Transform.translate(
                                offset: const Offset(2, -25),
                                child: Text(
                                  'th',
                                  //superscript is usually smaller in size
                                  textScaleFactor: 0.9,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              ),
                            )
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  shadowColor: Colors.black,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.20,
                    width: MediaQuery.of(context).size.height * 0.20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Constant.primarycolor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: '11',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 65,
                                    fontWeight: FontWeight.w500)),
                            WidgetSpan(
                              child: Transform.translate(
                                offset: const Offset(2, -25),
                                child: Text(
                                  'th',
                                  //superscript is usually smaller in size
                                  textScaleFactor: 0.9,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              ),
                            )
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  shadowColor: Colors.black,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.20,
                    width: MediaQuery.of(context).size.height * 0.20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Constant.primarycolor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: '12',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 65,
                                    fontWeight: FontWeight.w500)),
                            WidgetSpan(
                              child: Transform.translate(
                                offset: const Offset(2, -25),
                                child: Text(
                                  'th',
                                  //superscript is usually smaller in size
                                  textScaleFactor: 0.9,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              ),
                            )
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
