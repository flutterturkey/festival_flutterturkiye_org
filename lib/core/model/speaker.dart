import 'package:meta/meta.dart';

class Speaker {
  const Speaker({
    @required this.id,
    @required this.image,
    @required this.name,
    @required this.surname,
    @required this.about,
    this.company,
    this.twitter,
    this.github,
    this.linkedin,
  })  : assert(id != null),
        assert(image != null),
        assert(name != null),
        assert(surname != null),
        assert(about != null);

  final String id;
  final String image;
  final String name;
  final String surname;
  final String company;
  final String about;
  final String twitter;
  final String github;
  final String linkedin;
}
