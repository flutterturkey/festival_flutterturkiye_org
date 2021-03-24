import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Speaker extends Equatable {
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
