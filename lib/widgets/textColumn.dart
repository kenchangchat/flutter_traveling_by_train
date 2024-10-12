import 'package:flutter/material.dart';

class SetTextColumn extends StatelessWidget {
  const SetTextColumn(
      {required this.title,
      required this.subtitle,
      this.titleColor = Colors.grey,
      this.titleFontWeight = FontWeight.normal,
      this.subTitleColor = Colors.black,
      this.subTitleFontWeight = FontWeight.bold})
      : super();

  final String title;
  final Color? titleColor;
  final FontWeight? titleFontWeight;
  final String subtitle;
  final Color? subTitleColor;
  final FontWeight? subTitleFontWeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "$title",
          style: TextStyle(
            fontSize: 12,
            color: titleColor,
            fontWeight: titleFontWeight,
          ),
        ),
        Text(
          "$subtitle",
          style: TextStyle(
            fontSize: 12,
            fontWeight: subTitleFontWeight,
            color: subTitleColor,
          ),
        ),
      ],
    );
  }
}
