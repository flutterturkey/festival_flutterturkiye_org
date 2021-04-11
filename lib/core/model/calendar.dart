import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Calendar extends Equatable {
  const Calendar({
    @required this.title,
    @required this.description,
    @required this.startingTime,
    @required this.endingTime,
  })  : assert(title != null),
        assert(description != null),
        assert(startingTime != null),
        assert(endingTime != null);

  final String title;
  final String description;
  final DateTime startingTime;
  final DateTime endingTime;

  @override
  List<Object> get props => [title, description, startingTime, endingTime];

  String toLink() => 'https://www.google.com/calendar/render?action=TEMPLATE&'
      'text=$title'
      '&'
      'details=$description'
      '&'
      'dates=${toDateString(startingTime)}'
      '%2F'
      '${toDateString(endingTime)}';

  String toDateString(DateTime dateTime) {
    final gmtDateTime = dateTime.toUtc();
    return '${gmtDateTime.year}'
        '${gmtDateTime.month.toString().padLeft(2, '0')}'
        '${gmtDateTime.month.toString().padLeft(2, '0')}'
        'T'
        '${gmtDateTime.hour.toString().padLeft(2, '0')}'
        '${gmtDateTime.minute.toString().padLeft(2, '0')}'
        '${gmtDateTime.second.toString().padLeft(2, '0')}'
        'Z';
  }
}
