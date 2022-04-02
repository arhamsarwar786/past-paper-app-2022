import 'package:flutter/material.dart';

import '../Const.dart';

class Contactus extends StatefulWidget {
  const Contactus({Key? key}) : super(key: key);

  @override
  State<Contactus> createState() => _ContactusState();
}

class _ContactusState extends State<Contactus> {
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
          'Contact Us',
          style: Constant.myStyle,
        ),
      ),
    );
  }
}
