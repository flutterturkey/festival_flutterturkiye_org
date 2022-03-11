import 'package:flutter/material.dart';

class CircleImageWithBorder extends StatelessWidget {
  // ignore: lines_longer_than_80_chars
  const CircleImageWithBorder({
    required this.image,
    required this.imageSize,
    required this.borderColor,
    this.borderSize = 2,
    Key? key,
  })  : assert(imageSize > borderSize),
        super(key: key);

  final String image;
  final double imageSize;
  final double borderSize;
  final Color borderColor;

  @override
  Widget build(BuildContext context) => CircleAvatar(
        radius: imageSize,
        backgroundColor: borderColor,
        child: CircleAvatar(
          radius: imageSize - borderSize,
          backgroundImage: AssetImage(image),
        ),
      );
}
