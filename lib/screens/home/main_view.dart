import 'package:flutter/material.dart';
import 'colis/colis_view.dart';
import 'web_view.dart';
import 'welcome.dart';
import '../../widgets/drawer.dart';

class HomePageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePageView> {
  final primaryColor = Color(0xff327a5e);
  final secondaryColor = Color(0xfff2bb32);
  int _index = 0;
  List<Widget> _pages = [
    WelcomeView(),
    AgrikolisView(),
    ColisView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AGRIKOLIS",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: secondaryColor,
            fontFamily: "Poppins",
            letterSpacing: 3,
          ),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: secondaryColor),
      ),
      drawer: NavDrawer(onResult: (result) {
        setState(() {
          _index = result;
        });
      }),
      body: _pages[_index],
    );
  }
}
