import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// TODO: Application form link will be updated with the new special link.
///
/// Issue: #39 https://github.com/flutterturkey/festival_flutterturkiye_org/issues/39
const String _applicationFormUrl = 'https://forms.gle/987YW6xKdyYbPUtR6';

/// This button always navigates to the [Application Form].
///
/// You can reach the form by https://forms.gle/987YW6xKdyYbPUtR6
class SignInButton extends StatelessWidget {
  /// This default values prepared for [AppBar].
  const SignInButton({
    Key key,
    this.fontSize = 20.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
    this.fontWeight = FontWeight.w800,
  }) : super(key: key);

  final double fontSize;
  final EdgeInsets padding;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: () async {
          if (await canLaunch(_applicationFormUrl)) {
            await launch(_applicationFormUrl);
          }
        },
        child: Text(
          'Kayıt Ol',
          style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
        ),
      );
}
