import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../models/colis.dart';
import 'package:flutter/material.dart';

class EditColisView extends StatefulWidget {
  final Colis colis;
  EditColisView({this.colis});
  @override
  State<StatefulWidget> createState() {
    return _EditColisViewState(colis: colis);
  }
}

class _EditColisViewState extends State<EditColisView>
    with TickerProviderStateMixin {
  final primaryColor = Color(0xff327a5e);
  final secondaryColor = Color(0xfff2bb32);

  String _client;
  double _poids, _prix;
  bool _state = false;
  final _formkey = GlobalKey<FormState>();
  final db = Firestore.instance;
  Colis colis;
  _EditColisViewState({this.colis});

  _validateInputs() {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      animateButton();
      colis.client = _client;
      colis.poids = _poids;
      colis.prix = _prix;
      updateData(colis.userUID);
    }
  }

  void animateButton() {
    var controller =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    controller.forward();
    setState(() {
      _state = true;
    });
  }

  Widget _buildButtonChild() {
    return _state
        ? SizedBox(
            height: 26.0,
            width: 26.0,
            child: CircularProgressIndicator(
              value: null,
              valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
            ),
          )
        : Text(
            "MODIFIER",
            style: TextStyle(fontSize: 20),
          );
  }

  updateData(uid) async {
    await db
        .collection("userData")
        .document(uid)
        .collection('colis')
        .document(colis.uid)
        .updateData(colis.toJson())
        .then((value) {
      print("Updated");
      setState(() {
        _state = false;
      });
      Navigator.popUntil(context, (route) => route.isFirst);
    });
  }

  @override
  void initState() {
    _client = colis.client;
    _poids = colis.poids;
    _prix = colis.prix;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Text(
          "MODIFIER UN COLIS",
          style: TextStyle(
            color: secondaryColor,
            fontFamily: "Quicksand",
          ),
        ),
        backgroundColor: primaryColor,
        centerTitle: true,
        iconTheme: IconThemeData(color: secondaryColor),
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Image.asset(
                "assets/images/parcel.png",
                width: width * 0.8,
                height: width * 0.8,
              ),
            ),
            Container(
              padding:
                  EdgeInsets.fromLTRB(width * 8 / 100, 0, width * 8 / 100, 0),
              width: width,
              height: 90,
              child: TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: secondaryColor),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: secondaryColor),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                  labelStyle: TextStyle(color: primaryColor),
                  labelText: "Client",
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.person,
                    color: secondaryColor,
                  ),
                ),
                keyboardType: TextInputType.text,
                controller: TextEditingController(text: _client),
                validator: (value) {
                  if (value.isEmpty)
                    return "Ce champs est obligatoire !";
                  else
                    return null;
                },
                onChanged: (val) {
                  _client = val;
                },
              ),
            ),
            Container(
              padding:
                  EdgeInsets.fromLTRB(width * 8 / 100, 0, width * 8 / 100, 0),
              width: width,
              height: 90,
              child: TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: secondaryColor),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: secondaryColor),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                  labelStyle: TextStyle(color: primaryColor),
                  labelText: "Poids en KG",
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.archive_outlined,
                    color: secondaryColor,
                  ),
                ),
                keyboardType: TextInputType.number,
                controller: TextEditingController(text: _poids.toString()),
                validator: (value) {
                  if (value.isEmpty)
                    return "Ce champs est obligatoire !";
                  else if (double.parse(value) < 30)
                    return "Le poids doit être supérieur à 30 kg";
                  else
                    return null;
                },
                onChanged: (val) {
                  _poids = double.parse(val);
                },
              ),
            ),
            Container(
              padding:
                  EdgeInsets.fromLTRB(width * 8 / 100, 0, width * 8 / 100, 0),
              width: width,
              height: 90,
              child: TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: secondaryColor),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: secondaryColor),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                  labelStyle: TextStyle(color: primaryColor),
                  labelText: "Prix en Euro",
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.money_rounded,
                    color: secondaryColor,
                  ),
                ),
                keyboardType: TextInputType.number,
                controller: TextEditingController(text: _prix.toString()),
                validator: (value) {
                  if (value.isEmpty)
                    return "Ce champs est obligatoire !";
                  else if (double.parse(value) <= 0)
                    return "Le prix doit être supérieur à 0";
                  else
                    return null;
                },
                onChanged: (val) {
                  _prix = double.parse(val);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: width * 0.1,
                right: width * 0.1,
              ),
              height: height * 7 / 100,
              child: RaisedButton(
                color: secondaryColor,
                textColor: primaryColor,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                child: _buildButtonChild(),
                onPressed: _validateInputs,
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
