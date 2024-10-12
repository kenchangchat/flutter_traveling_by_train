// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utilities/constants.dart';

class MyRouteDetailPage extends StatefulWidget {
  final Map data;
  const MyRouteDetailPage({required this.data}) : super();
  @override
  State<MyRouteDetailPage> createState() =>
      _MyRouteDetailPageState(data: this.data);
}

class _MyRouteDetailPageState extends State<MyRouteDetailPage> {
  Map data;
  _MyRouteDetailPageState({required this.data});

  String urlRoute = "";

  @override
  void initState() {
    super.initState();
    setState(() {
      urlRoute =
          "https://www.google.com/maps/dir/?api=1&origin=${data['from_station']['name']}&destination=${data['to_station']['name']}&travelmode=transit";
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLOR_THEME_MAIN,
      appBar: AppBar(
        backgroundColor: COLOR_THEME,
        elevation: 0.0,
        title: Text(
          "รายละเอียดเส้นทาง",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [],
      ),
      body: Container(
        color: COLOR_THEME_LIGHT,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                  color: COLOR_THEME,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${data['from_station']['name']}",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "${data['from_station']['code']}",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "(${data['from_station']['line']})",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          child: Text(
                        "--->",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      )),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${data['to_station']['name']}",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "${data['to_station']['code']}",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "(${data['to_station']['line']})",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                  color: COLOR_THEME,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${data['total_fare']}",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              " บาท",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    VerticalDivider(
                      color: Colors.grey,
                      thickness: 2,
                      width: 20, // กำหนดความกว้างของช่องว่างรอบๆ divider
                      indent: 5, // ขอบด้านบน
                      endIndent: 5, // ขอบด้านล่าง
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${data['total_time']}",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              " นาที",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    VerticalDivider(
                      color: Colors.grey,
                      thickness: 2,
                      width: 20, // กำหนดความกว้างของช่องว่างรอบๆ divider
                      indent: 5, // ขอบด้านบน
                      endIndent: 5, // ขอบด้านล่าง
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${data['total_stations']}",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              " สถานี",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: SingleChildScrollView(
                  child: ListView.builder(
                    shrinkWrap: true,
                    reverse: false,
                    addAutomaticKeepAlives: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: data['lines'].length,
                    itemBuilder: (BuildContext context, int index) {
                      var item = data['lines'][index];
                      Color _color = Colors.grey;
                      switch (item['color']) {
                        case "green":
                          _color = Colors.green;
                          break;
                        case "blue":
                          _color = Colors.blue;
                          break;
                        default:
                          _color = Colors.grey;
                          break;
                      }
                      String _title = "เดิน ${item['time']} นาที";
                      String _price = "";
                      if (item['stations'].length > 0) {
                        _title = "${item['line']}";
                        _price = "${item['time']} นาที / ${item['fare']} บาท";
                      }
                      return Container(
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          elevation: 2,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Text(
                                        "#${index + 1}: $_title",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: _color,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        "$_price",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  children: [
                                    item['stations'].length > 0
                                        ? Container(
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              reverse: false,
                                              addAutomaticKeepAlives: true,
                                              scrollDirection: Axis.vertical,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount:
                                                  item['stations'].length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int indexStation) {
                                                var itemStation =
                                                    item['stations']
                                                        [indexStation];
                                                return Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Icon(
                                                        Icons.adjust,
                                                        color: _color,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 5,
                                                      child: Text(
                                                          '${itemStation['code']}-${itemStation['name']}'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          )
                                        : Container()
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
              InkWell(
                onTap: () async {
                  Uri routeURL = Uri.parse('$urlRoute');
                  if (await canLaunchUrl(routeURL)) {
                    await launchUrl(routeURL);
                  } else {
                    throw 'ERROR: $urlRoute';
                  }
                },
                child: Container(
                  width: double.maxFinite,
                  height: 50,
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: COLOR_THEME),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "ดูเส้นทางบนแผนที่",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: COLOR_THEME_MAIN,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, top: 4),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
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
