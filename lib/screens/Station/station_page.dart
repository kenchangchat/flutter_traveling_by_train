// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../utilities/constants.dart';
import '../../utilities/http.dart';
import '../../utilities/utils.dart';

class MyStationPage extends StatefulWidget {
  @override
  State<MyStationPage> createState() => _MyStationPageState();
}

class _MyStationPageState extends State<MyStationPage> {
  final ReqHttp _req = new ReqHttp();
  final Util _utils = new Util();

  List stationList = [];

  @override
  void initState() {
    super.initState();
    getStationList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getStationList() async {
    setState(() {
      stationList = [];
    });
    try {
      var resp = await _req.reqPostAPI('/api/getStationsList', {});
      if (resp.isNotEmpty && resp['success'] == true) {
        if (resp['data']['data'].length > 0) {
          var data = resp['data']['data'];
          setState(() {
            stationList.addAll(data);
          });
        }
      } else {
        _utils.showToast(
          context,
          "เกิดข้อผิดพลาด",
          "ไม่พบข้อมูล",
        );
      }
    } catch (err) {
      _utils.showToast(
        context,
        "เกิดข้อผิดพลาด",
        "โปรดลองใหม่อีกครั้ง",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLOR_THEME_MAIN,
      appBar: AppBar(
        backgroundColor: COLOR_THEME,
        elevation: 0.0,
        title: Text(
          "สถานี",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: COLOR_THEME_LIGHT,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "รายการสถานีทั้งหมด",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(color: COLOR_THEME_GRAY),
                stationList.length > 0
                    ? Container(
                        child: Column(
                          children: [
                            Container(
                              child: SingleChildScrollView(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  reverse: false,
                                  addAutomaticKeepAlives: true,
                                  scrollDirection: Axis.vertical,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: stationList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var item = stationList[index];
                                    Color _color = Colors.black;
                                    switch (item['type']) {
                                      case "BTS":
                                        _color = Colors.green;
                                        break;
                                      case "MRT":
                                        _color = Colors.blue;
                                        break;
                                      default:
                                        _color = Colors.orange;
                                        break;
                                    }
                                    return InkWell(
                                      onTap: () {},
                                      child: Container(
                                        child: Card(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(5),
                                                child: Text(
                                                  "${item['code']} - ${item['name']} (${item['type']})",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: _color,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(5),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        "เปิดทำการ:",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        "${item['first_train']} น.",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        "ปิดทำการ:",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        "${item['last_train']} น.",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black,
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
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
