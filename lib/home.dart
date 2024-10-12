// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'screens/Login/login.dart';
import 'screens/Station/route_page.dart';
import 'screens/Station/station_page.dart';
import 'utilities/constants.dart';
import 'utilities/storage.dart';
import 'utilities/utils.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Util _utils = new Util();
  final Storage _storage = new Storage();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> logout() async {
    _utils.showConfirm(context, "ยืนยัน", "คุณต้องการ 'ออกจากระบบ' ใช่หรือไม่?",
        () async {
      await _storage.deleteAll();
      Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
          type: PageTransitionType.bottomToTop,
          child: LoginPage(),
          inheritTheme: true,
          ctx: context,
        ),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLOR_THEME_MAIN,
      appBar: AppBar(
        backgroundColor: COLOR_THEME,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Text(
          "Welcome",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: "ออกจากระบบ",
            icon: Icon(
              Icons.power_settings_new,
              color: Colors.red,
            ),
            color: Colors.white,
            onPressed: () {
              logout();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: COLOR_THEME_LIGHT,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(top: 5),
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    decoration: BoxDecoration(
                      color: COLOR_THEME_BRIGHT,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            'การเดินทางด้วยรถไฟ',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Image(
                            height: 100,
                            fit: BoxFit.fill,
                            image:
                                const AssetImage('assets/images/logo_icon.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: MyStationPage(),
                                  inheritTheme: true,
                                  ctx: context),
                            );
                          },
                          child: Card(
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey, spreadRadius: 1),
                                ],
                              ),
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(
                                      height: 100,
                                      fit: BoxFit.fill,
                                      image: const AssetImage(
                                          'assets/images/station.png'),
                                    ),
                                    Center(
                                      child: Text(
                                        "สถานี",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: MyRoutePage(),
                                  inheritTheme: true,
                                  ctx: context),
                            );
                          },
                          child: Card(
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey, spreadRadius: 1),
                                ],
                              ),
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(
                                      height: 100,
                                      fit: BoxFit.fill,
                                      image: const AssetImage(
                                          'assets/images/route_map.png'),
                                    ),
                                    Center(
                                      child: Text(
                                        "ค้นหาเส้นทาง",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
