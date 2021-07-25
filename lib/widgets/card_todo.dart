import 'package:flutter/material.dart';

class CardTodo extends StatefulWidget{
  final dynamic todo;
  final BuildContext context;
  const CardTodo(this.todo, this.context);

  @override
  _CardTodoState createState() => _CardTodoState();
}

class _CardTodoState extends State<CardTodo>{
  int is_star=0;

  void setStar(){
    if(is_star==0){
      setState(() {
        is_star=1;
      });
    }else{
      setState(() {
        is_star=0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 10),
        child: Card(
            child: Stack(
              children: [
                Column(
                  children: [
                    Text(widget.todo.title),
                    Text(widget.todo.desc)
                  ],
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon: is_star == 1 ? Icon(
                          Icons.star,
                          color: Colors.yellowAccent, size: 24.0
                      ) : Icon(
                        Icons.star_border,
                        color: Colors.yellowAccent,
                        size: 24.0,
                      ),
                      onPressed: () => setStar,
                    )
                )
              ],
            ),
        )
    );
  }
}