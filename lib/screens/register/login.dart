import 'package:auto_size_text/auto_size_text.dart';
import '../../services/auth_service.dart';
import 'package:flutter/material.dart';
import 'sign_up.dart';
import '../home/main_view.dart';

class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginViewState();
  }
}

class _LoginViewState extends State<LoginView> with TickerProviderStateMixin {
  final primaryColor = Color(0xff327a5e);
  final secondaryColor = Color(0xfff2bb32);

  String _email, _password, _warning;
  bool _obscure = true, _state = false;
  final _formkey = GlobalKey<FormState>();
  AuthService auth = AuthService();

  _validateInputs() async {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      animateButton();
      try {
        String uid = await auth.signInWithEmailAndPassword(_email, _password);
        print("User Id : $uid");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => HomePageView(),
          ),
        );
      } catch (e) {
        print(e);
        setState(() {
          _warning = e.message;
        });
      } finally {
        setState(() {
          _state = false;
        });
      }
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

  Widget showWarning() {
    if (_warning != null) {
      return Container(
        color: Colors.amberAccent,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.error_outline),
            ),
            Expanded(
              child: AutoSizeText(_warning, maxLines: 3),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    _warning = null;
                  });
                },
              ),
            ),
          ],
        ),
      );
    } else {
      return SizedBox(
        height: 0,
      );
    }
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
            "SE CONNECTER",
            style: TextStyle(fontSize: 22),
          );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      backgroundColor: primaryColor,
      body: Form(
        key: _formkey,
        child: ListView(
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            showWarning(),
            SizedBox(
              height: height * 0.05,
            ),
            Image.asset(
              "assets/images/logo.png",
              height: height * 0.3,
              width: height * 0.3,
            ),
            SizedBox(
              height: height * 0.05,
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
                  labelText: "Email",
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.alternate_email,
                    color: secondaryColor,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty)
                    return "Ce champs est obligatoire !";
                  else
                    return null;
                },
                onChanged: (val) {
                  _email = val;
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
                  labelText: "Mot de passe",
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.vpn_key,
                    color: secondaryColor,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      print(_obscure);
                      setState(() {
                        _obscure = !_obscure;
                      });
                    },
                  ),
                ),
                obscureText: _obscure,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value.isEmpty)
                    return "Ce champs est obligatoire !";
                  else
                    return null;
                },
                onChanged: (val) {
                  _password = val;
                },
              ),
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
                child: _buildButtonChild(),
                onPressed: _state ? null : _validateInputs,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              child: AutoSizeText(
                "S'INSCRIRE",
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(
                  color: secondaryColor,
                  fontFamily: "QuickSand",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onTap: _state
                  ? null
                  : () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => SignUpView(),
                        ),
                      );
                    },
            ),
          ],
        ),
      ),
    );
  }
}
