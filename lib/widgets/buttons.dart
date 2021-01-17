import 'package:flutter/material.dart';

import '../colors.dart';

Widget simpleButton(String buttonText, {Function onTap, fontSize = 24.0}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 5),
    height: 60,
    child: RaisedButton(
      child: Text(buttonText,
          style: TextStyle(
            color: buttonTextColor,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          )),
      onPressed: onTap,
      color: buttonColor,
    ),
  );
}
