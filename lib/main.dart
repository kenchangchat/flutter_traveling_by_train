import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';

import 'home.dart';
import 'screens/Login/login.dart';
import 'utilities/storage.dart';
import 'utilities/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Storage _storage = new Storage();
  final Util _utils = new Util();
  bool _loader = true;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future checkLogin() async {
    try {
      bool token = false;
      Map logUser = await _storage.getAuthList();
      print(logUser);
      if (logUser.length > 0) {
        if (logUser.containsKey('token')) {
          if (logUser['token'] != null && logUser['token'] != "null") {
            token = true;
          } else {
            token = false;
          }
        } else {
          token = false;
        }
      }
      Future.delayed(Duration(seconds: 3), () {
        setState(() => _loader = false);
        if (token) {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              child: HomePage(),
              inheritTheme: true,
              ctx: context,
            ),
          );
        } else {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              child: LoginPage(),
              // child: HomePage(),
              inheritTheme: true,
              ctx: context,
            ),
          );
        }
      });
    } catch (err) {
      setState(() => _loader = false);
      _utils.showAlert(context, "ERROR", err.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: _loader
            ? Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                // color: COLOR_THEME,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bg_login.png'),
                    fit: BoxFit.cover,
                  ),
                  // gradient: LinearGradient(
                  //   begin: Alignment.topCenter,
                  //   end: Alignment.bottomCenter,
                  //   colors: [COLOR_THEME, COLOR_THEME, COLOR_THEME],
                  //   stops: [0, 0.5, 0.9],
                  // ),
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Image(
                          height: 100,
                          // fit: BoxFit.fill,
                          image:
                              const AssetImage('assets/images/logo_icon.png'),
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                      SpinKitSpinningLines(
                        color: Colors.white,
                        size: 50,
                      )
                    ],
                  ),
                ),
              )
            : Container(),
      ),
    );
  }
}
