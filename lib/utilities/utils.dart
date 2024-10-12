// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

import '../screens/Login/login.dart';
import 'constants.dart';
import 'storage.dart';

final Storage _storage = new Storage();
// late FToast fToast;

class Util {
  showToast(BuildContext context, String title, subtitle) {
    FToast fToast = FToast();
    fToast.init(context);

    fToast.showToast(
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 5),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: COLOR_THEME_TRANS_GRAY,
        ),
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: title.isNotEmpty ? '$title: ' : '',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: COLOR_THEME_LIGHT,
                    ),
                  ),
                  TextSpan(
                    text: '$subtitle',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showAlert(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        title: new Text(title, textAlign: TextAlign.center),
        content: new Text(
          content,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.red,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('ปิด'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  void showAlertNext(
      BuildContext context, String title, String content, Function callback) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title, textAlign: TextAlign.center),
          content: Container(
            width: 300,
            height: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(content, textAlign: TextAlign.center),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    callback();
                  },
                  child: Container(
                    height: 80,
                    padding: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check,
                          size: 30,
                          color: Colors.green,
                        ),
                        SizedBox(height: 5),
                        Text("ยืนยัน"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showConfirm(
      BuildContext context, String title, String content, Function callback) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title, textAlign: TextAlign.center),
          content: Container(
            width: 300,
            height: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(content, textAlign: TextAlign.center),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Card(
                          shadowColor: COLOR_THEME_ACCENTUATED,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              height: 80,
                              padding: EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.cancel,
                                    size: 30,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(height: 5),
                                  Text("ยกเลิก"),
                                ],
                              ),
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Card(
                          shadowColor: COLOR_THEME_ACCENTUATED,
                          child: InkWell(
                            onTap: () {
                              callback();
                            },
                            child: Container(
                              height: 80,
                              padding: EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.check,
                                    size: 30,
                                    color: Colors.green,
                                  ),
                                  SizedBox(height: 5),
                                  Text("ยืนยัน"),
                                ],
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void backToLogin(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("แจ้งเตือน!", textAlign: TextAlign.center),
          contentPadding: EdgeInsets.all(5),
          content: Container(
            width: 300,
            height: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("มีการเปลี่ยนแปลงข้อมูลผู้ใช้งาน")],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("โปรดทำการเข้าสู่ระบบใหม่ อีกครั้ง")],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () async {
                          await _storage.deleteAll();
                          // Navigator.pushAndRemoveUntil(
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.bottomToTop,
                              child: LoginPage(),
                              inheritTheme: true,
                              ctx: context,
                            ),
                            // (route) => false,
                          );
                        },
                        child: Container(
                          height: 80,
                          padding: EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.logout,
                                size: 30,
                                color: COLOR_THEME_INTENSIVE,
                              ),
                              SizedBox(height: 5),
                              Text("ยืนยัน"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String timeAgo(BuildContext context, String dateStart, String dateEnd) {
    try {
      DateTime date = DateTime.parse(this.dateFormat(dateStart, 'yyyy-MM-dd'));
      DateTime date2 = DateTime.parse(this.dateFormat(dateEnd, 'yyyy-MM-dd'));
      final difference = date2.difference(date);

      if (difference.inDays >= 1) {
        return '${(difference.inDays + 1)}';
      } else {
        return '0';
      }
    } catch (e) {
      return '0';
    }
  }

  String dateFormat(String dateString, String formatDate) {
    try {
      final DateTime now = DateTime.parse(dateString);
      final DateFormat formatter = DateFormat(formatDate);
      final String formatted = formatter.format(now);
      return formatted;
    } catch (e) {
      return 'Null';
    }
  }

  String dateFormat2(String dateString) {
    try {
      final months_en = [
        "January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December",
      ];
      // final months_th = [
      //   "มกราคม",
      //   "กุมภาพันธ์",
      //   "มีนาคม",
      //   "เมษายน",
      //   "พฤษภาคม",
      //   "มิถุนายน",
      //   "กรกฎาคม",
      //   "สิงหาคม",
      //   "กันยายน",
      //   "ตุลาคม",
      //   "พฤศจิกายน",
      //   "ธันวาคม",
      // ];
      // final months_th_mini = [
      //   "ม.ค.",
      //   "ก.พ.",
      //   "มี.ค.",
      //   "เม.ย.",
      //   "พ.ค.",
      //   "มิ.ย.",
      //   "ก.ค.",
      //   "ส.ค.",
      //   "ก.ย.",
      //   "ต.ค.",
      //   "พ.ย.",
      //   "ธ.ค.",
      // ];
      final splitted = dateString.split(' ');
      final index_d = splitted[1].substring(0, (splitted[1].length - 1));
      final index_m = months_en.indexOf(splitted[0]);
      final index_y = splitted[2];
      String d = index_d.toString();
      String m = index_m.toString();
      String y = index_y.toString();
      if (int.parse(d) < 10) d = '0' + d;
      if (int.parse(m) < 10) m = '0' + m;
      return d + "-" + m + "-" + y;
    } catch (e) {
      return 'Null';
    }
  }

  String dateFormat3(String dateString) {
    try {
      final splitted = dateString.split('-');
      return splitted[2] + "-" + splitted[1] + "-" + splitted[0];
    } catch (e) {
      return 'Null';
    }
  }
}

class PolylineUtils {
  static const double PRECISION = 1e5;
  static const int CHARCODE_OFFSET = 63;
  static Map<int, String> CHARMAP = {};

  static List<List<double>> decode(String value) {
    List<List<double>> points = [];
    double lat = 0;
    double lon = 0;

    var values = _decodeIntegers(value, (x, y) {
      lat += x;
      lon += y;
      points.add([lat / PRECISION, lon / PRECISION]);
    });

    return points;
  }

  static int _decodeSign(int value) {
    return value & 1 != 0 ? ~(value >> 1) : (value >> 1);
  }

  static int _decodeIntegers(String value, void Function(int, int) callback) {
    // List<int> values = [];
    int values = 0;
    int x = 0;
    int y = 0;

    int byte = 0;
    int current = 0;
    int bits = 0;

    for (int i = 0; i < value.length; i++) {
      byte = value.codeUnitAt(i) - 63;
      current = current | ((byte & 0x1F) << bits);
      bits = bits + 5;

      if (byte < 0x20) {
        if (++values & 1 != 0) {
          x = _decodeSign(current);
        } else {
          y = _decodeSign(current);
          callback(x, y);
        }
        current = 0;
        bits = 0;
      }
    }

    return values;
  }

  static String encode(List<List<double>> points) {
    int px = 0, py = 0;

    return _reduce(points, (String str, double lat, double lon) {
      int x = (lat * 1e5).round();
      int y = (lon * 1e5).round();

      str += _chars(_sign(x - px)) + _chars(_sign(y - py));

      px = x;
      py = y;

      return str;
    });
  }

  static String _reduce(List<List<double>> points,
      String Function(String, double, double) callback) {
    List<double> point;
    double lat = 0;
    double lon = 0;
    String str = '';

    for (int i = 0; i < points.length; i++) {
      point = points[i];
      lat = point[0];
      lon = point[1];
      str = callback(str, lat, lon);
    }

    return str;
  }

  static int _sign(int value) {
    return (value < 0) ? ~(value << 1) : (value << 1);
  }

  static int _charCode(int value) {
    return ((value & 0x1F) | 0x20) + 63;
  }

  static String _chars(int value) {
    String str = '';

    while (value >= 0x20) {
      str += String.fromCharCode(_charCode(value));
      value = value >> 5;
    }

    str += String.fromCharCode(value + 63);

    return str;
  }
}
