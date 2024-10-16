// ignore_for_file: must_be_immutable

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../utilities/constants.dart';
import '../../utilities/http.dart';
import '../../utilities/utils.dart';
import 'route_detail_page.dart';

class MyRoutePage extends StatefulWidget {
  @override
  State<MyRoutePage> createState() => _MyRoutePageState();
}

class _MyRoutePageState extends State<MyRoutePage> {
  final ReqHttp _req = new ReqHttp();
  final Util _utils = new Util();

  String from_station_val = "";
  String to_station_val = "";
  List<Station> stations = [];
  List routeList = [];

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
      stations = [];
    });
    try {
      // var resp = await _req.reqPostAPI('/api/getStationsList', {});
      // if (resp.isNotEmpty && resp['success'] == true) {
      //   if (resp['data']['data'].length > 0) {
      //     var data = resp['data']['data'];
      //     for (var i in data) {
      //       setState(() {
      //         stations.add(Station(id: i['station_id'], name: i['name']));
      //       });
      //     }
      //   }
      // } else {
      //   _utils.showToast(
      //     context,
      //     "เกิดข้อผิดพลาด",
      //     "ไม่พบข้อมูล",
      //   );
      // }
      List data = [
        {
          "station_id": 1,
          "type": "BTS",
          "name": "หมอชิต",
          "code": "N8",
          "lat": 13.802,
          "lng": 100.551,
          "first_train": "05:00",
          "last_train": "11:00 "
        },
        {
          "station_id": 2,
          "type": "BTS",
          "name": "พญาไท",
          "code": "N2",
          "lat": 13.755,
          "lng": 100.532,
          "first_train": "05:00",
          "last_train": "11:00"
        },
        {
          "station_id": 3,
          "type": "BTS",
          "name": "สยาม",
          "code": "CEN",
          "lat": 13.745,
          "lng": 100.534,
          "first_train": "05:00",
          "last_train": "11:00"
        },
        {
          "station_id": 4,
          "type": "MRT",
          "name": "สวนจตุจักร",
          "code": "BL13",
          "lat": 13.803,
          "lng": 100.553,
          "first_train": "05:00",
          "last_train": "11:00"
        },
        {
          "station_id": 5,
          "type": "MRT",
          "name": "สุขุมวิท",
          "code": "BL21",
          "lat": 13.736,
          "lng": 100.56,
          "first_train": "05:00",
          "last_train": "23:00"
        },
        {
          "station_id": 6,
          "type": "ARL",
          "name": "พญาไท",
          "code": "ARL1",
          "lat": 13.756,
          "lng": 100.532,
          "first_train": "05:00",
          "last_train": "23:00"
        }
      ];
      setState(() {
        for (var i in data) {
          setState(() {
            stations.add(Station(id: i['station_id'], name: i['name']));
          });
        }
      });
    } catch (err) {
      _utils.showToast(
        context,
        "เกิดข้อผิดพลาด",
        "โปรดลองใหม่อีกครั้ง",
      );
    }
  }

  onSearchRoute() async {
    setState(() {
      routeList = [];
    });
    try {
      // Map param = {"from_station_id": "1", "to_station_id": "5"};
      // var resp = await _req.reqPostAPI('/api/getRoute', param);
      // if (resp.isNotEmpty && resp['success'] == true) {
      //   if (resp['data']['data'].length > 0) {
      //     var data = resp['data']['data'];
      //     setState(() {
      //       routeList.addAll(data);
      //     });
      //   }
      // } else {
      //   _utils.showToast(
      //     context,
      //     "เกิดข้อผิดพลาด",
      //     "ไม่พบข้อมูล",
      //   );
      // }
      List data = [
        {
          "from_station": {
            "name": "หมอชิต",
            "code": "N8",
            "line": "BTS สายสีเขียว"
          },
          "to_station": {
            "name": "สุขุมวิท",
            "code": "BL21",
            "line": "MRT สายสีน้ำเงิน"
          },
          "lines": [
            {
              "line": "BTS สายสีเขียว",
              "color": "green",
              "stations": [
                {"name": "หมอชิต", "code": "N8"},
                {"name": "สะพานควาย", "code": "N7"},
                {"name": "อารีย์", "code": "N5"},
                {"name": "สนามเป้า", "code": "N4"},
                {"name": "อนุสาวรีย์ชัยสมรภูมิ", "code": "N3"},
                {"name": "พญาไท", "code": "N2"}
              ],
              "fare": 40,
              "time": 30
            },
            {
              "line": "BTS สายสีเขียว - MRT สายสีน้ำเงิน",
              "color": "grey",
              "stations": [],
              "fare": 0,
              "time": 5
            },
            {
              "line": "MRT สายสีน้ำเงิน",
              "color": "blue",
              "stations": [
                {"name": "เพชรบุรี", "code": "BL20"},
                {"name": "สุขุมวิท", "code": "BL21"}
              ],
              "fare": 30,
              "time": 10
            }
          ],
          "total_stations": 8,
          "total_time": 45,
          "total_fare": 70,
          "fare_breakdown": [
            {"line": "BTS สายสีเขียว", "fare": 40},
            {"line": "MRT สายสีน้ำเงิน", "fare": 30}
          ]
        }
      ];
      setState(() {
        routeList.addAll(data);
      });
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
          "ค้นหาเส้นทาง",
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
                stations.length > 0
                    ? Container(
                        margin: EdgeInsets.only(top: 5),
                        padding: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                        // decoration: BoxDecoration(
                        //   color: COLOR_THEME_OPPOSITE_LIGHT,
                        //   borderRadius: BorderRadius.all(Radius.circular(5)),
                        // ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                // width: 100,
                                padding: EdgeInsets.only(right: 5),
                                child: DropdownSearch<Station>(
                                  popupProps: PopupProps.menu(
                                    showSearchBox: true,
                                  ),
                                  items: stations,
                                  itemAsString: (Station val) => val.name,
                                  dropdownDecoratorProps:
                                      DropDownDecoratorProps(
                                    dropdownSearchDecoration: InputDecoration(
                                      labelText: "ต้นทาง",
                                      hintText: "เลือกสถานี",
                                    ),
                                  ),
                                  onChanged: (Station? selected) {
                                    if (selected != null) {
                                      setState(() {
                                        from_station_val =
                                            selected.id.toString();
                                      });
                                    }
                                  },
                                  selectedItem: stations[0],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Icon(Icons.arrow_forward),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                // width: 100,
                                padding: EdgeInsets.only(right: 5),
                                child: DropdownSearch<Station>(
                                  popupProps: PopupProps.menu(
                                    showSearchBox: true,
                                  ),
                                  items: stations,
                                  itemAsString: (Station val) => val.name,
                                  dropdownDecoratorProps:
                                      DropDownDecoratorProps(
                                    dropdownSearchDecoration: InputDecoration(
                                      labelText: "ปลายทาง",
                                      hintText: "เลือกสถานี",
                                    ),
                                  ),
                                  onChanged: (Station? selected) {
                                    if (selected != null) {
                                      setState(() {
                                        to_station_val = selected.id.toString();
                                      });
                                    }
                                  },
                                  selectedItem: stations[4],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: COLOR_THEME,
                  ),
                  child: TextButton.icon(
                    icon: Icon(
                      Icons.search_sharp,
                      color: COLOR_THEME_MAIN,
                    ),
                    label: Text(
                      "ค้นหา",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      onSearchRoute();
                    },
                  ),
                ),
                routeList.length > 0
                    ? Container(
                        padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                        child: Text(
                          "เส้นทางทั้งหมด",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : Container(),
                routeList.length > 0
                    ? Divider(color: COLOR_THEME_GRAY)
                    : Container(),
                routeList.length > 0
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
                                  itemCount: routeList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var item = routeList[index];
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType
                                                  .rightToLeft,
                                              child:
                                                  MyRouteDetailPage(data: item),
                                              inheritTheme: true,
                                              ctx: context),
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: COLOR_THEME,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(5),
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "เส้นทางแนะนำที่ ${index + 1} : ${item['from_station']['code']},${item['to_station']['code']}",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .arrow_circle_right_outlined,
                                                    size: 20,
                                                    color: Colors.white,
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(5),
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                color: COLOR_THEME,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${item['total_fare']}",
                                                            style: TextStyle(
                                                              fontSize: 24,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          Text(
                                                            " บาท",
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  VerticalDivider(
                                                    color: Colors.grey,
                                                    thickness: 2,
                                                    width:
                                                        20, // กำหนดความกว้างของช่องว่างรอบๆ divider
                                                    indent: 5, // ขอบด้านบน
                                                    endIndent: 5, // ขอบด้านล่าง
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${item['total_time']}",
                                                            style: TextStyle(
                                                              fontSize: 24,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          Text(
                                                            " นาที",
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  VerticalDivider(
                                                    color: Colors.grey,
                                                    thickness: 2,
                                                    width:
                                                        20, // กำหนดความกว้างของช่องว่างรอบๆ divider
                                                    indent: 5, // ขอบด้านบน
                                                    endIndent: 5, // ขอบด้านล่าง
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${item['total_stations']}",
                                                            style: TextStyle(
                                                              fontSize: 24,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          Text(
                                                            " สถานี",
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
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

class Station {
  final int id;
  final String name;

  Station({required this.id, required this.name});

  @override
  String toString() => name; // ใช้ name เป็นตัวแสดงผล
}
