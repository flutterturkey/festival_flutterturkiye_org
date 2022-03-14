import 'package:flutter/material.dart';

class DialogHelper {
  DialogHelper._();

  static void show(
    BuildContext context, {
    required Color backgroundColor,
    required ShapeBorder shape,
    required Widget content,
  }) =>
      showDialog(
        context: context,
        builder: (dialogContext) => AlertDialog(
          backgroundColor: backgroundColor,
          shape: shape,
          content: content,
        ),
      );
}
