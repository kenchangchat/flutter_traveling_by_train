import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:page_transition/page_transition.dart';

import '../../home.dart';
import '../../utilities/constants.dart';
import '../../utilities/http.dart';
import '../../utilities/storage.dart';
import '../../utilities/utils.dart';
import '../../widgets/loading.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ReqHttp _req = new ReqHttp();
  final Util _utils = new Util();
  final Storage _storage = new Storage();
  final _formKey = GlobalKey<FormState>();
  bool _loader = false;

  Color _button_login_color = COLOR_THEME;

  TextEditingController loginUsernameController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  final FocusNode focusNodeUsername = FocusNode();
  final FocusNode focusNodePassword = FocusNode();
  bool _obscureTextPassword = true;
  String versionApp = "";
  String packageName = "";
  Map dataUser = {};
  Locale locale = Locale("th");

  @override
  void initState() {
    super.initState();
    checkInfo();
    checkLogin();
    setState(() {
      loginUsernameController.text = "test";
      loginPasswordController.text = "1234";
    });
  }

  @override
  void dispose() {
    super.dispose();
    focusNodeUsername.dispose();
    focusNodePassword.dispose();
  }

  Future<void> checkInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      versionApp = packageInfo.version;
      packageName = packageInfo.packageName;
    });
  }

  Future checkLogin() async {
    try {
      setState(() => _loader = true);
      bool token = false;
      Map logUser = await _storage.getAuthList();
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
      Future.delayed(Duration(seconds: 1), () {
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
        }
      });
    } catch (err) {
      setState(() => _loader = false);
      _utils.showAlert(context, "ERROR", err.toString());
    }
  }

  Future<void> _onLogin() async {
    setState(() => _loader = true);
    var paramlogin = {
      "username": loginUsernameController.text,
      "password": loginPasswordController.text
    };
    print(paramlogin);
    // Future.delayed(Duration(seconds: 2), () {
    //   setState(() => _loader = false);
    //   Navigator.push(
    //     context,
    //     PageTransition(
    //       type: PageTransitionType.rightToLeft,
    //       child: HomePage(),
    //       inheritTheme: true,
    //       ctx: context,
    //     ),
    //   );
    // });
    if (paramlogin['username'] != '' && paramlogin['password'] != '') {
      try {
        var resUser = await _req.reqLogin('/api/login', paramlogin);
        if (resUser.isNotEmpty && resUser['success'] == true) {
          if (resUser['data']['data'] != null) {
            var data = resUser['data']['data'];
            setState(() {
              dataUser['user_id'] = data['user_id'] ?? "";
              dataUser['user_name'] = data['user_name'] ?? "";
              dataUser['user_username'] = data['user_username'] ?? "";
              dataUser['user_type'] = data['user_type'] ?? "";
              dataUser['token'] = data['token'] ?? "";
            });
            await _storage.setAuthList(dataUser);
            Future.delayed(Duration(seconds: 2), () {
              setState(() => _loader = false);
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: HomePage(),
                  inheritTheme: true,
                  ctx: context,
                ),
              );
            });
          } else {
            setState(() => _loader = false);
            var msgError = resUser['error'] != null
                ? resUser['error']
                : "Username หรือ Password ไม่ถูกต้อง!";
            _utils.showAlert(context, "ผิดพลาด", msgError);
          }
        } else {
          setState(() => _loader = false);
          var msgError =
              resUser['error'] != null ? resUser['error'] : "เกิดข้อผิดพลาด!";
          _utils.showAlert(context, "ERROR", msgError);
        }
      } catch (e) {
        setState(() => _loader = false);
        _utils.showAlert(context, "ERROR", e.toString());
      }
    } else {
      setState(() => _loader = false);
      _utils.showAlert(
        context,
        "แจ้งเตือน",
        "โปรดระบุ Username หรือ Password ให้ถูกต้อง",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLOR_THEME_MAIN,
      resizeToAvoidBottomInset: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // padding: EdgeInsets.all(20),
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
        child: Center(
          child: SingleChildScrollView(
            reverse: true,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Image(
                      height: 200,
                      fit: BoxFit.fill,
                      image: const AssetImage('assets/images/logo_icon.png'),
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    child: Card(
                      color: Color.fromARGB(110, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      margin: EdgeInsets.only(left: 20, right: 20),
                      elevation: 8,
                      child: Container(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                        child: Column(
                          children: [
                            Text(
                              "ลงชื่อเข้าสู่ระบบ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: COLOR_THEME_MAIN,
                              ),
                            ),
                            SizedBox(height: 15),
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 15, right: 15),
                                    child: PhysicalModel(
                                      borderRadius: BorderRadius.circular(12.0),
                                      color: COLOR_THEME_MAIN,
                                      elevation: 0,
                                      child: TextFormField(
                                        focusNode: focusNodeUsername,
                                        controller: loginUsernameController,
                                        keyboardType: TextInputType.text,
                                        cursorColor: COLOR_THEME,
                                        textAlign: TextAlign.left,
                                        decoration: InputDecoration(
                                          hintText: 'ชื่อผู้ใช้งาน',
                                          filled: true,
                                          fillColor: COLOR_THEME_SOFT,
                                          suffixIcon: loginUsernameController
                                                      .text.length >
                                                  0
                                              ? IconButton(
                                                  onPressed: () {
                                                    loginUsernameController
                                                        .clear();
                                                    setState(() {});
                                                  },
                                                  icon: Icon(Icons.clear),
                                                )
                                              : null,
                                          prefixIconColor: COLOR_THEME,
                                          prefixIcon: Container(
                                            margin: EdgeInsets.all(6),
                                            // padding: EdgeInsets.all(25),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              // borderRadius: BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(0),
                                              child: Icon(Icons.account_box),
                                            ),
                                          ),
                                          contentPadding: EdgeInsets.all(12),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 0,
                                              color: Colors.white,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 0,
                                              color: Colors.white,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        ),
                                        // validator: RequiredValidator(
                                        //   errorText: 'กรุณากรอก Username',
                                        // ),
                                        onFieldSubmitted: (_) {
                                          focusNodePassword.requestFocus();
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 15, right: 15),
                                    child: PhysicalModel(
                                      borderRadius: BorderRadius.circular(12.0),
                                      color: COLOR_THEME_MAIN,
                                      elevation: 0,
                                      child: TextFormField(
                                        focusNode: focusNodePassword,
                                        controller: loginPasswordController,
                                        keyboardType: TextInputType.text,
                                        obscureText: _obscureTextPassword,
                                        cursorColor: COLOR_THEME,
                                        textAlign: TextAlign.left,
                                        decoration: InputDecoration(
                                          hintText: 'รหัสผ่าน',
                                          filled: true,
                                          fillColor: COLOR_THEME_SOFT,
                                          prefixIconColor: COLOR_THEME,
                                          suffixIcon: loginPasswordController
                                                      .text.length >
                                                  0
                                              ? IconButton(
                                                  onPressed: () {
                                                    loginPasswordController
                                                        .clear();
                                                    setState(() {});
                                                  },
                                                  icon: Icon(Icons.clear),
                                                )
                                              : null,
                                          prefixIcon: Container(
                                            margin: EdgeInsets.all(6),
                                            // padding: EdgeInsets.all(25),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              // borderRadius: BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(0),
                                              child: Icon(Icons.lock, size: 20),
                                            ),
                                          ),
                                          contentPadding: EdgeInsets.all(12),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 0,
                                              color: Colors.white,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 0,
                                              color: Colors.white,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        ),
                                        // validator: RequiredValidator(
                                        //   errorText: 'กรุณากรอก Password',
                                        // ),
                                        textInputAction: TextInputAction.go,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  _loader
                                      ? LoadingSpinKit()
                                      : InkWell(
                                          onTap: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              _formKey.currentState!.save();
                                              _onLogin();
                                            }
                                          },
                                          onTapCancel: () {
                                            setState(() {
                                              _button_login_color = COLOR_THEME;
                                            });
                                          },
                                          onTapUp: (detail) {
                                            setState(() {
                                              _button_login_color = COLOR_THEME;
                                            });
                                          },
                                          onTapDown: (detail) {
                                            setState(() {
                                              _button_login_color =
                                                  COLOR_THEME_DARK;
                                            });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 15,
                                                right: 15,
                                                bottom: 10),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 50,
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: COLOR_THEME,
                                                    spreadRadius: 0.01,
                                                    blurRadius: 1,
                                                    // offset: Offset(1, 1),
                                                  ),
                                                ],
                                                color: _button_login_color,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'เข้าสู่ระบบ',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: COLOR_THEME_MAIN,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
