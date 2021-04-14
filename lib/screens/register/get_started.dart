import 'package:flutter/material.dart';
import 'sign_up.dart';
import 'login.dart';

class GetStartedView extends StatelessWidget {
  final primaryColor = Color(0xff327a5e);
  final secondaryColor = Color(0xfff2bb32);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: height * 0.3,
              width: height * 0.3,
            ),
            SizedBox(
              height: height * 0.1,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Quicksand',
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Vous êtes agriculteur et vous cherchez un",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: " revenu complémentaire",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: secondaryColor,
                        ),
                      ),
                      TextSpan(
                        text: " sans investissement ?",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            Container(
              padding:
                  EdgeInsets.fromLTRB(width * 5 / 100, 0, width * 5 / 100, 0),
              height: height * 7 / 100,
              width: width,
              child: RaisedButton(
                color: primaryColor,
                textColor: secondaryColor,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                    side: BorderSide(
                      color: secondaryColor,
                    )),
                child: Text(
                  "REJOINDRE NOTRE RÉSEAU",
                  style: TextStyle(fontSize: 22),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => SignUpView(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              padding:
                  EdgeInsets.fromLTRB(width * 5 / 100, 0, width * 5 / 100, 0),
              height: height * 7 / 100,
              width: width,
              child: RaisedButton(
                color: secondaryColor,
                textColor: primaryColor,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                child: Text(
                  "SE CONNECTER",
                  style: TextStyle(fontSize: 22),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => LoginView(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
