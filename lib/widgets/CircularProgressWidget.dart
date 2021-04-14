import 'package:flutter/material.dart';

class CircularProgressWidget extends StatelessWidget {
  final Color primaryColor = Color(0xff327a5e);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: SizedBox(
              height: 56.0,
              width: 56.0,
              child: CircularProgressIndicator(
                value: null,
                valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "Veuillez attendre svp ...",
            style: TextStyle(fontFamily: "Quicksand", fontSize: 19),
          ),
        ],
      ),
    );
  }
}
