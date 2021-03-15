import 'package:meta/meta.dart';

class SpeakerModel {
  final String id;
  final String image;
  final String name;
  final String surname;
  final String company;
  final String about;
  final String twitter;
  final String github;
  final String linkedin;

  const SpeakerModel({
    @required this.id,
    @required this.image,
    @required this.name,
    @required this.surname,
    this.company,
    @required this.about,
    this.twitter,
    this.github,
    this.linkedin,
  })  : assert(id != null),
        assert(image != null),
        assert(name != null),
        assert(surname != null),
        assert(about != null);
}
