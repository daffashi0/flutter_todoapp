import 'package:flutter/material.dart';
import 'package:todoapp/models/todo_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TodoProvider with ChangeNotifier {
  bool isLoading = false;
  bool isRequestError = false;
  List<TodoModel> todoList = [];

  Future<void> getTodolist() async {
    isRequestError = false;
    List<TodoModel> tempList = [];
    Uri url = Uri.parse('http://localhost/todo');
    try {
      isLoading = true;
      final response = await http.get(url);
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      tempList.add(TodoModel.fromJson(responseData));
      todoList = tempList;
      isLoading = false;
      notifyListeners();
      print('Success');
    } catch (e) {
      isLoading = false;
      isRequestError = true;
      notifyListeners();
      throw (e);
      print('Error');
    }
  }

}
