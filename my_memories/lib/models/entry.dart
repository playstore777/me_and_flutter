import 'package:flutter/foundation.dart';

class Entry {
  final String id;
  final String title;
  final String description;
  final DateTime date;

  Entry({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.date,
  });
}
