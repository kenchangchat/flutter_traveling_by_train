import 'package:flutter/material.dart';

import '../utilities/constants.dart';
import '../utilities/storage.dart';

class DashboardButton extends StatelessWidget {
  const DashboardButton({
    required this.code,
    required this.icon,
    required this.color,
    required this.number,
    required this.text,
    required this.data,
    required this.fontRange,
    required this.onTap,
  }) : super();

  final String code;
  final IconData icon;
  final Color color;
  final int number;
  final String text;
  final List data;
  final VoidCallback onTap;
  final int fontRange;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Storage _storage = new Storage();
        _storage.setStorage('filter_code', code.toString());
        if (code.toString() == "status_1") {
          DefaultTabController.of(context).animateTo(2);
        } else {
          DefaultTabController.of(context).animateTo(1);
        }
      },
      child: Card(
        shadowColor: COLOR_THEME_ACCENTUATED,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 1,
              ), //BoxShadow
            ],
          ),
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        '$number',
                        style: TextStyle(
                          fontSize: fontRange >= 0
                              ? (20 + fontRange).toDouble()
                              : (fontRange + 20).toDouble(),
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Icon(icon,
                        size: fontRange >= 0
                            ? (30 + fontRange).toDouble()
                            : (fontRange + 30).toDouble(),
                        color: color),
                  ),
                ],
              ),
              Center(
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: fontRange >= 0
                          ? (14 + fontRange).toDouble()
                          : (fontRange + 14).toDouble(),
                      color: Colors.black45),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
