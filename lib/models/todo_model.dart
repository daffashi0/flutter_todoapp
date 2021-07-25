import 'package:flutter/material.dart';

class TodoModel with ChangeNotifier {
  var id;
  var category_id;
  var is_starred;
  var title;
  var desc;

  TodoModel({
    this.id,
    this.category_id,
    this.is_starred,
    this.title,
    this.desc,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    final List types = json['types'];
      return TodoModel(
        id: json['id'],
        category_id: json['category_id'],
        is_starred: json['is_starred'],
        title: json['title'],
        desc: json['desc']
      );
  }
}
