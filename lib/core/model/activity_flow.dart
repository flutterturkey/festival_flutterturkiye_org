import 'package:equatable/equatable.dart';

class ActivityFlow extends Equatable {
  const ActivityFlow(
    this.title,
    this.subtitle,
    this.iconPath,
  );

  final String title;
  final String subtitle;
  final String iconPath;

  @override
  List<Object> get props => [
        title,
        subtitle,
        iconPath,
      ];
}
