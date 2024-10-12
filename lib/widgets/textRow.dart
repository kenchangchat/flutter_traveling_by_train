import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class SetTextRow extends StatelessWidget {
  const SetTextRow({
    required this.title,
    required this.subtitle,
    this.subTitleColor = COLOR_THEME_BRIGHT,
    this.subTitleFontWeight = FontWeight.bold
  }) : super();

  final String title;
  final String subtitle;
  final Color? subTitleColor;
  final FontWeight? subTitleFontWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            "$title:",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            "$subtitle",
            style: TextStyle(
              fontSize: 12,
              fontWeight: this.subTitleFontWeight,
              color: this.subTitleColor,
            ),
          ),
        ),
      ],
    );
  }
}
