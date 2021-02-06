extension ImagePathExtension on String {
  /// png extension with toPNG "assets/images/$this.png"
  String get toPNG => "assets/images/$this.png";

  /// jpg extension with toJPG "assets/images/$this.jpg"
  String get toJPG => "assets/images/$this.jpg";
}
