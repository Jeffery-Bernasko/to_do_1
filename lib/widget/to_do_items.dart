import 'package:flutter/material.dart';

import '../model/todo.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({Key? key, required this.todo, this.onToDeleteItem, this.onToChanged}) : super(key: key);

  final ToDo todo;
  final onToDeleteItem;
  final onToChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: ListTile(
        onTap: (){
          onToChanged(todo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: Colors.white,
        leading: Icon(todo.isDone? Icons.check_box : Icons.check_box_outline_blank,color: Colors.grey,),
        title: Text(
          todo.todoText!,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            //Add the decoration
            decoration: todo.isDone? TextDecoration.lineThrough: null
          ),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(color: Colors.grey.shade700, borderRadius: BorderRadius.circular(5)),
          child: IconButton(
            color: Colors.white,
            icon: Icon(Icons.delete),
            onPressed: (){
              onToDeleteItem(todo.id);
            },
          ),
        ),

      ),
    );
  }


  }

