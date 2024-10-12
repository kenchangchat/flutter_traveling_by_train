import 'package:flutter/material.dart';
import '../utilities/constants.dart';
import 'field_container.dart';

class RoundedInputField extends StatelessWidget {
  const RoundedInputField({Key? key, this.hintText, this.icon = Icons.person})
      : super(key: key);
  final String? hintText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        cursorColor: COLOR_THEME_MAIN,
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: COLOR_THEME_MAIN,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(),
            border: InputBorder.none),
      ),
    );
  }
}
