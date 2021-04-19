import 'package:meta/meta.dart';

abstract class Asset {
  const Asset({
    @required this.file,
    @required this.path,
  })  : assert(file != null),
        assert(path != null);

  final String file;
  final String path;

  @override
  String toString() => 'assets/$path/$file';
}

class ImageAsset extends Asset {
  const ImageAsset(String file, {String subfolder})
      : super(
          file: file,
          path: subfolder == null ? _folder : '$_folder/$subfolder',
        );

  static const _folder = 'images';
}

class VideoAsset extends Asset {
  const VideoAsset(String file, {String subfolder})
      : super(
          file: file,
          path: subfolder == null ? _folder : '$_folder/$subfolder',
        );

  static const _folder = 'videos';
}
