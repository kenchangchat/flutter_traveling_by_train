import 'package:flutter/material.dart';

class SetTextSpan extends StatelessWidget {
  const SetTextSpan({
    required this.title,
    required this.subtitle,
  }) : super();

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$title: ',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          TextSpan(
            text: '$subtitle',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
