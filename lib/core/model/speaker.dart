import 'package:festival_flutterturkiye_org/core/model/database_model.dart';
import 'package:meta/meta.dart';

class Speaker extends DatabaseModel {
  const Speaker({
    @required this.id,
    @required this.name,
    @required this.title,
    this.image,
    this.about,
    this.twitter,
    this.github,
    this.linkedin,
  })  : assert(id != null),
        assert(title != null),
        assert(name != null);

  factory Speaker.fromMap(Map<String, dynamic> map) => Speaker(
        id: map['id'],
        image: map['image'],
        name: map['name'],
        title: map['title'],
        about: map['about'],
        twitter: map['twitter'],
        github: map['github'],
        linkedin: map['linkedin'],
      );

  final String id;
  final String image;
  final String name;
  final String title;
  final String about;
  final String twitter;
  final String github;
  final String linkedin;

  @override
  List<Object> get props => [
        id,
        image,
        name,
        title,
        about,
        twitter,
        github,
        linkedin,
      ];
}
