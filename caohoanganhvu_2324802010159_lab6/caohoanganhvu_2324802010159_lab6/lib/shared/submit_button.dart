import 'package:caohoanganhvu_2324802010159_lab6/constants/border_styles.dart';
import 'package:flutter/material.dart';

MaterialButton submitButton({
  required BuildContext context,
  required Color backgroundColor,
  required Color textColor,
  required String title,
  required VoidCallback? method,
}) {
  return MaterialButton(
    color: backgroundColor,
    textColor: textColor,
    minWidth: double.infinity,
    height: 60,
    shape: BorderStyles.buttonBorder,
    onPressed: method,
    child: Text(title),
  );
}
