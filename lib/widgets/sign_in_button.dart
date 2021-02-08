import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:hackathon_flutterturkiye_org/core/styles/theme_helper.dart';

// TODO: Application form link will be updated with the new special link.
const String _applicationFormUrl = 'https://forms.gle/987YW6xKdyYbPUtR6';

/// This button always navigates to the [Application Form].
///
/// You can reach the form by https://forms.gle/987YW6xKdyYbPUtR6
class SignInButton extends StatelessWidget {
  /// This default values prepared for [AppBar].
  const SignInButton({
    Key key,
    this.fontSize = 20.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 36.0, vertical: 16.0),
    this.fontWeight = FontWeight.w800,
  }) : super(key: key);

  final double fontSize;
  final EdgeInsets padding;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () async {
        if (await canLaunch(_applicationFormUrl)) {
          await launch(_applicationFormUrl);
        }
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: ThemeHelper.lightColor,
      padding: padding,
      textColor: ThemeHelper.darkColor,
      child: Text(
        'Kayıt Ol',
        style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
      ),
    );
  }
}
