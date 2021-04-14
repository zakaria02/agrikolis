import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'add_colis.dart';

class ColisVideView extends StatelessWidget {
  final primaryColor = Color(0xff327a5e);
  final secondaryColor = Color(0xfff2bb32);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            "Mes Colis",
            style: TextStyle(
              fontFamily: "Quicksand",
              fontWeight: FontWeight.bold,
              fontSize: 25,
              decoration: TextDecoration.underline,
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Image.asset("assets/images/vide.png"),
          SizedBox(
            height: height * 0.05,
          ),
          AutoSizeText(
            "Vous n'avez pas de colis",
            style: TextStyle(
              fontFamily: "Quicksand",
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Container(
            padding:
                EdgeInsets.fromLTRB(width * 5 / 100, 0, width * 5 / 100, 0),
            height: height * 7 / 100,
            width: width,
            child: RaisedButton(
              color: secondaryColor,
              textColor: Colors.black,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
              child: Text(
                "AJOUTER UN COLIS",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => AddColisView(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
