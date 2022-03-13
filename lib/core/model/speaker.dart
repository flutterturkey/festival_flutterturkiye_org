import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:festival_flutterturkiye_org/core/model/database_model.dart';

class Speaker extends DatabaseModel {
  const Speaker({
    this.reference,
    this.name,
    this.title,
    this.image,
    this.about,
    this.twitter,
    this.github,
    this.linkedin,
  });

  factory Speaker.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot;
    return Speaker(
      reference: data.reference,
      image: data['image'],
      name: data['name'],
      title: data['title'],
      about: data['about'],
      twitter: data['twitter'],
      github: data['github'],
      linkedin: data['linkedin'],
    );
  }

  final String? image;
  final String? name;
  final String? title;
  final String? about;
  final String? twitter;
  final String? github;
  final String? linkedin;
  final DocumentReference? reference;

  @override
  List<Object?> get props => [
        reference,
        image,
        name,
        title,
        about,
        twitter,
        github,
        linkedin,
        reference,
      ];
}
