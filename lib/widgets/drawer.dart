import '../screens/register/get_started.dart';
import '../widgets/provider_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NavDrawer extends StatelessWidget {
  final primaryColor = Color(0xff327a5e);
  final secondaryColor = Color(0xfff2bb32);

  final ValueChanged onResult;
  NavDrawer({this.onResult});

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  showAlert(BuildContext context) {
    Widget cancelButton = FlatButton(
      child: Text(
        "NON",
        style: TextStyle(
          fontFamily: 'Poppins',
          color: secondaryColor,
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text(
        "OUI",
        style: TextStyle(
          fontFamily: 'Poppins',
          color: secondaryColor,
        ),
      ),
      onPressed: () {
        Provider.of(context).auth.signOut();
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => GetStartedView(),
          ),
        );
      },
    );

    AlertDialog alert = AlertDialog(
      content: Text(
        "Voulez-vous vraiment se déconnecter?",
        style: TextStyle(
          fontFamily: 'Poppins',
        ),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: primaryColor,
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: SizedBox(
                  height: 0,
                ),
                decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/background.jpg'),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.input,
                  color: secondaryColor,
                ),
                title: Text(
                  'ACCEUIL',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Quicksand",
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  onResult(0);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.public,
                  color: secondaryColor,
                ),
                title: Text(
                  'AGRIKOLIS.COM',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Quicksand",
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  onResult(1);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.local_activity,
                  color: secondaryColor,
                ),
                title: Text(
                  'MES COLIS',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Quicksand",
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  onResult(2);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: secondaryColor,
                ),
                title: Text(
                  'SE DÉCONNECTER',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Quicksand",
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                onTap: () {
                  showAlert(context);
                },
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Divider(
                  height: 5,
                  color: secondaryColor,
                ),
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      child: Image.asset(
                        "assets/images/facebook.png",
                        width: 40,
                        height: 40,
                      ),
                      onTap: () {
                        _launchURL("https://www.facebook.com/agrikolis");
                        Navigator.pop(context);
                      },
                    ),
                    InkWell(
                      child: Image.asset(
                        "assets/images/instagram.png",
                        width: 40,
                        height: 40,
                      ),
                      onTap: () {
                        _launchURL("https://www.instagram.com/agrikolisfr/");
                        Navigator.pop(context);
                      },
                    ),
                    InkWell(
                      child: Image.asset(
                        "assets/images/twitter.png",
                        width: 40,
                        height: 40,
                      ),
                      onTap: () {
                        _launchURL("https://twitter.com/agrikolis");
                        Navigator.pop(context);
                      },
                    ),
                    InkWell(
                      child: Image.asset(
                        "assets/images/linkedin.png",
                        width: 40,
                        height: 40,
                      ),
                      onTap: () {
                        _launchURL(
                          "https://www.linkedin.com/company/agrikolis/",
                        );
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
