import 'dart:core';
import 'package:flutter/material.dart';
import 'package:login_page/model/todo.dart';
import 'package:login_page/widget/to_do_items.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoList = ToDo.todoList();
  List<ToDo> _foundToDo =[];
  final _todoController = TextEditingController();
  final _emailController = TextEditingController();

  _handletoDeleteIten(String id){
    setState((){
      todoList.removeWhere((item) => item.id == id);
    });
  }

  _handletoDoChange(ToDo todo){
    setState((){
      todo.isDone = !todo.isDone;
    });
  }

  _addtoDoItem(String toDo){
    if(toDo.isEmpty){}
    else{
      setState((){
        todoList.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(), todoText: toDo));
      });
      _todoController.clear();
      FocusScope.of(context).unfocus();
    }
  }

  _runFilter(String keyword) {
    List<ToDo> result = [];
    if(keyword.isEmpty){result = todoList;}
    else{
      result = todoList
          .where((item) => item.todoText!
          .toLowerCase()
          .contains(keyword
          .toLowerCase()))
          .toList();
    }
    setState(() {
      _foundToDo = result;
    });
  }
  @override
  void initState(){
    _foundToDo = todoList;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List'),
        backgroundColor: Colors.grey.shade700,

      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top:15,bottom: 20),
                          child: const Text("All To Do List",
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                          ),
                        ),
                        for(ToDo todoo in _foundToDo.reversed)
                          ToDoItem(todo: todoo,onToChanged: _handletoDoChange,onToDeleteItem: _handletoDeleteIten,)
                      ],
                    )
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                              bottom: 20,
                              right: 20,
                              left: 20,
                            ),
                            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 10.0,
                                  spreadRadius: 0.0
                              )
                              ],
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: TextField(
                              controller: _todoController,
                                decoration: InputDecoration(
                                    hintText: "Add new todo item",
                                    border: InputBorder.none
                                ),
                            ),
                          ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          right: 20,
                          bottom: 20
                        ),
                        child: ElevatedButton(
                          child: Text('+',style: TextStyle(fontSize: 40),),
                          onPressed: (){
                            _addtoDoItem(_todoController.text);
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.grey.shade700,
                              minimumSize: Size(60,60),
                              elevation: 10
                          ),
                        ),
                      )
                    ],
                  ),
                )

              ],
            ),
          )
        ],
      ),
    );
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(2),
          hintText: "Search",
          hintStyle: TextStyle(color: Colors.grey.shade700),
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: Colors.black, size: 20,),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
        ),
      ),
    );
  }
}
