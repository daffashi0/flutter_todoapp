import 'package:flutter/material.dart';
import 'package:todoapp/widgets/card_todo.dart';
import 'package:todoapp/providers/todo_provider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    Provider.of<TodoProvider>(context, listen: false).getTodolist();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<TodoProvider>(context);
    final todoData = data.todoList;

    return Scaffold(
      appBar: AppBar(
        title: Text("TO DO LIST"),
      ),
      body: Container(
          child: ListView(
            padding: EdgeInsets.only(top: 20),
            children: [
              Column(
                children: todoData
                    .map((item) => CardTodo(item, context))
                    .toList(),
              ),
            ],
          ),
      )
    );
  }

}