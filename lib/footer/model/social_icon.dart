import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SocialMedia extends Equatable {
  const SocialMedia({@required this.icon, @required this.url})
      : assert(icon != null),
        assert(url != null);

  final IconData icon;
  final String url;

  @override
  List<Object> get props => [icon, url];
}
