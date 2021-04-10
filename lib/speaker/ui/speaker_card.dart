import 'package:festival_flutterturkiye_org/core/model/speaker.dart';
import 'package:festival_flutterturkiye_org/core/ui/speaker_detail_content.dart';
import 'package:festival_flutterturkiye_org/core/ui/speaker_image.dart';
import 'package:festival_flutterturkiye_org/core/utils/image_assets.dart';
import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';
import 'package:flutter/material.dart';

class SpeakerCard extends StatelessWidget {
  const SpeakerCard({@required this.speaker, Key key})
      : assert(speaker != null),
        super(key: key);

  final Speaker speaker;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (dialogContext) => AlertDialog(
              backgroundColor: ThemeHelper.darkColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              content: SpeakerDetailContent(speaker: speaker),
            ),
          );
        },
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: ThemeHelper.darkColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: ClipOval(
                    child: speaker.image == null
                        ? Image.asset(
                            ImageAssets.speakerPlaceHolder,
                            fit: BoxFit.fitHeight,
                          )
                        : SpeakerImage(
                            speakerImage: speaker.image,
                            imageSize: 72,
                            borderSize: 4,
                          ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      speaker.name,
                      maxLines: 2,
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: ThemeHelper.lightColor,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      speaker.title,
                      maxLines: 2,
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        color: ThemeHelper.lightColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
}
