import 'package:book_app/Const.dart';

import 'package:flutter/material.dart';

import 'Home.dart';
import 'SelectYear.dart';

class BookSelection extends StatefulWidget {
  const BookSelection({Key? key}) : super(key: key);

  @override
  _BookSelectionState createState() => _BookSelectionState();
}

class _BookSelectionState extends State<BookSelection> {
  static const _sub = [
    'English',
    'Chemistry',
    'Mathematics',
    'Biology',
    'Physics',
    'Urdu',
    'Islamiyat',
    'Pak-Study',
    'Computer',
  ];
  static const _img = [
    'assets/English.jpg',
    'assets/Chemistry.jpg',
    'assets/Math.jpg',
    'assets/Biology.jpg',
    'assets/Physics.jpg',
    'assets/Urdu.jpg',
    'assets/Islamiyat.jpg',
    'assets/Pak-study.jpg',
    'assets/CS.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        foregroundColor: Constant.primarycolor,
        centerTitle: true,
        backgroundColor: Constant.primarycolor,
        leading: Tooltip(
          message: 'Go Back',
          child: InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => MainPage()));
            },
            child: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            ),
          ),
        ),
        title: Text(
          "Subjects",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GridView.builder(
          itemCount: _sub.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 2.3,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, bottom: 8.0, left: 10, right: 10),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (_) => YearSelect(
                            _sub[index],
                          )));
                },
                child: Card(
                  elevation: 6,
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          colorFilter: new ColorFilter.mode(
                              Colors.black54.withOpacity(0.9),
                              BlendMode.exclusion),
                          image: AssetImage(_img[index],),
                          fit: BoxFit.cover,
                        )),
                        // child: Column(
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     Text(
                        //       _sub[index],
                        //       style: TextStyle(
                        //           color: Colors.white,
                        //           fontSize: 35,
                        //           fontWeight: FontWeight.w600),
                        //     ),
                        //   ],
                        // ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.50,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black38,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _sub[index],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  // fontFamily: 'PublicSans',
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    ));
  }
}
