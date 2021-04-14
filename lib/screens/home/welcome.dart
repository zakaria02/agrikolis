import 'package:AGRIKOLIS/widgets/CircularProgressWidget.dart';
import 'package:AGRIKOLIS/widgets/provider_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class WelcomeView extends StatelessWidget {
  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Provider.of(context).auth.getCurrentUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            name = snapshot.data.displayName;
            return Welcome(name: name);
          } else
            return CircularProgressWidget();
        },
      ),
    );
  }
}

class Welcome extends StatelessWidget {
  final primaryColor = Color(0xff327a5e);
  final secondaryColor = Color(0xfff2bb32);
  final String name;
  Welcome({this.name});
  final String bullet = "\u2022 ";
  final Uri _emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'zakaria.bensalem.1@gmail.com',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            AutoSizeText(
              "BONJOUR ${name.toUpperCase()} ET BIENVENUE DANS L'APPLICATION QUE J'AI CRÉE POUR",
              style: TextStyle(
                fontFamily: "Quicksand",
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            AutoSizeText(
              "AGRIKOLIS.\n",
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: secondaryColor,
                letterSpacing: 2,
              ),
              textAlign: TextAlign.center,
            ),
            AutoSizeText(
              "DANS CETTE MINI-APPLICATION VOUS ALLEZ TROUVEZ LES OPTIONS SUIVANTES :\n",
              style: TextStyle(
                fontFamily: "Quicksand",
                fontSize: 20,
              ),
              textAlign: TextAlign.start,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: AutoSizeText(
                "$bullet Création d'un compte avec un nom, un email et un mot de passe.\n",
                style: TextStyle(
                  fontFamily: "Quicksand",
                  fontSize: 20,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: AutoSizeText(
                "$bullet Authentification avec un email et un mot de passe.\n",
                style: TextStyle(
                  fontFamily: "Quicksand",
                  fontSize: 20,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: AutoSizeText(
                "$bullet Une webview vers le site agrikolis.com.\n",
                style: TextStyle(
                  fontFamily: "Quicksand",
                  fontSize: 20,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: AutoSizeText(
                "$bullet Une liste scrollable des colis avec la possibilité d'ajouter ou modifier un colis.\n",
                style: TextStyle(
                  fontFamily: "Quicksand",
                  fontSize: 20,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: AutoSizeText(
                "$bullet Se déconnecter.\n",
                style: TextStyle(
                  fontFamily: "Quicksand",
                  fontSize: 20,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: AutoSizeText(
                "$bullet Des boutons qui redirige vers les différents réseaux sociaux d’agrikolis.\n",
                style: TextStyle(
                  fontFamily: "Quicksand",
                  fontSize: 20,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            AutoSizeText(
              "Si vous avez aimé mon travail ou si vous avez une question, merci de me contacter sur :",
              style: TextStyle(
                fontFamily: "Quicksand",
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AutoSizeText(
                  "Mon numéro de téléphone :",
                  style: TextStyle(
                    fontFamily: "Quicksand",
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.start,
                ),
                Spacer(),
                IconButton(
                  icon: Image.asset("assets/images/call.png"),
                  onPressed: () {
                    launch("tel:+33672076624");
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AutoSizeText(
                  "Mon gmail :",
                  style: TextStyle(
                    fontFamily: "Quicksand",
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.start,
                ),
                Spacer(),
                IconButton(
                  icon: Image.asset("assets/images/email.png"),
                  onPressed: () {
                    launch(_emailLaunchUri.toString());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
