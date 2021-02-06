import 'package:flutter/material.dart';
import 'package:hackathon_flutterturkiye_org/utils/assets.dart';

class SpeakerCard extends StatefulWidget {
  @override
  _SpeakerCardState createState() => _SpeakerCardState();
}

class _SpeakerCardState extends State<SpeakerCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        debugPrint('clicked 2 speaker card');
        //TODO: Implement when speaker detail on finished
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Color(0xff212937),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: ClipOval(
                  child: Image.asset(
                    Assets.speakerPlaceHolder,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Göktuğ Özdemir',
                      maxLines: 2,
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text('Flutter Dev @ Unknown',
                        maxLines: 2,
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontSize: 16,
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
