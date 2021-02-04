import 'package:flutter/material.dart';

Widget sectionTitle(String title, {bool isPrimary = true}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 70.0),
    child: Text(
      title,
      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 48, color: isPrimary ? Colors.black : Colors.white),
    ),
  );
}
