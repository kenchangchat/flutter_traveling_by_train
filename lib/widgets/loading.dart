import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utilities/constants.dart';

class LoadingSpinKit extends StatefulWidget {
  @override
  _LoadingSpinKitState createState() => _LoadingSpinKitState();
}

class _LoadingSpinKitState extends State<LoadingSpinKit> {
  @override
  Widget build(BuildContext context) {
    return SpinKitSpinningLines(
      color: COLOR_THEME,
      size: 30,
    );
  }
}
