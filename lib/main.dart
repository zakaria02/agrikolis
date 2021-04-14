import 'screens/home/main_view.dart';
import 'screens/register/get_started.dart';
import 'services/auth_service.dart';
import 'widgets/provider_widget.dart';
import 'widgets/CircularProgressWidget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Provider(
      auth: AuthService(),
      child: MaterialApp(
        home: HomeController(),
        theme: ThemeData(
          primaryColor: Color(0xfff2bb32),
        ),
      ),
    );
  }
}

class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of(context).auth;
    return StreamBuilder(
      stream: auth.onAuthStateChange,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          if (signedIn) {
            return HomePageView();
          } else {
            return GetStartedView();
          }
        }
        return CircularProgressWidget();
      },
    );
  }
}
