import 'package:flutter/material.dart';
import '../utilities/constants.dart';
import 'field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  const RoundedPasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: true,
        cursorColor: COLOR_THEME_MAIN,
        decoration: const InputDecoration(
            icon: Icon(
              Icons.lock,
              color: COLOR_THEME_MAIN,
            ),
            hintText: "Password",
            hintStyle: TextStyle(),
            suffixIcon: Icon(
              Icons.visibility,
              color: COLOR_THEME_MAIN,
            ),
            border: InputBorder.none),
      ),
    );
  }
}
