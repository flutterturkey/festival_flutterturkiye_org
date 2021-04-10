import 'package:festival_flutterturkiye_org/core/model/speaker.dart';
import 'package:festival_flutterturkiye_org/core/ui/speaker_detail_content.dart';
import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';
import 'package:flutter/material.dart';

class DialogHelper {
  DialogHelper._();

  static void show(
    BuildContext context, {
    @required Color backgroundColor,
    @required ShapeBorder shape,
    @required Widget content,
  }) =>
      showDialog(
        context: context,
        builder: (dialogContext) => AlertDialog(
          backgroundColor: backgroundColor,
          shape: shape,
          content: content,
        ),
      );

  static void showSpeaker(
    BuildContext context, {
    @required Speaker speaker,
  }) =>
      show(
        context,
        backgroundColor: ThemeHelper.darkColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: SpeakerDetailContent(speaker: speaker),
      );

  static void showAvailableSoon(BuildContext context) => show(
        context,
        backgroundColor: ThemeHelper.darkColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: const SizedBox(
          height: 100,
          child: Center(
            child: Text(
              'Bu sayfa yakında hazır olacak :)',
              style: TextStyle(
                color: ThemeHelper.lightColor,
                fontSize: 36,
              ),
            ),
          ),
        ),
      );
}
