import 'package:flutter/material.dart';
import 'package:flutter_basic/pages/colors.dart';
import 'package:flutter_basic/pages/mydrawer.dart';
import 'package:flutter_basic/pages/todo.dart';
import 'package:flutter_basic/pages/todoitem.dart';

class TodoListTab extends StatefulWidget {
  const TodoListTab({super.key});

  @override
  State<TodoListTab> createState() => _TodoListTabState();
}

class _TodoListTabState extends State<TodoListTab> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();
  TextEditingController addtodocontroller = TextEditingController();
  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        backgroundColor: tdBlue,
        title: const Text(
          "To-Do List",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        // leading: Container(),
        // backgroundColor: tdBGColor,
        // actions: [],
        // title:  Row(
        //   children: [
        //     const Icon(
        //       Icons.menu,
        //       color: tdBlack,
        //       size: 30,
        //     ),
        //     Container(
        //       height: 40,
        //       width: 40,
        //       child: ClipRRect(child: Image.asset('assets/image/profile.jpeg'),),
        //     ),
        //   ],
        // ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                searchbox(),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 20, bottom: 15),
                  child: const Text(
                    "All ToDo",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      // Container(
                      //   margin: const EdgeInsets.only(top: 50,
                      //   bottom: 20),
                      //   child: const Text("All ToDo",
                      //   style: TextStyle(
                      //     fontSize: 30,
                      //     fontWeight: FontWeight.w500
                      //   ),),
                      // ),
                      // ignore: unused_local_variable
                      for (ToDo todoo in _foundToDo.reversed)
                        TodoItem(
                          todo: todoo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                        ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: TextFormField(
                        controller: _todoController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(

                            //icon: Icon(Icons.toc),
                            hintText: 'Add List',
                            //labelText: 'Add To Do ',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 168, 170, 172))),
                        onSaved: (String? value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                        validator: (String? value) {
                          // if (value == null || value.isEmpty) {
                          //   return "Name can not be empty!";
                          // }
                          return null;
                          // return (value != null && value.value)
                          //     ? 'Do not use the @ char.'
                          //     : null;
                        },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                          iconSize: 45,
                          onPressed: () => _addToDoItem(_todoController.text),
                          icon: const Icon(Icons.add_box)),
                    )
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  margin:
                      const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  // decoration:   BoxDecoration(
                  //   color: Colors.white,
                  //   boxShadow: BoxShadow(
                  //     color: Colors.grey,
                  //     offset: Offset(0.0, 0.0),
                  //     blurRadius: 10.0,
                  //     spreadRadius: 0.0,
                  //   )
                  // ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }

  _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  _addToDoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: toDo,
      ));
    });
    _todoController.clear();
  }

  _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }

  Widget searchbox() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    margin: const EdgeInsets.only(top: 15),
    decoration: BoxDecoration(
        color: const Color.fromARGB(158, 199, 190, 190),
        borderRadius: BorderRadius.circular(25)),
    child: TextField(
      onChanged: (value) {
        _runFilter(value);
      },
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(0),
        prefixIcon: Icon(
          Icons.search,
          color: tdBlack,
          size: 20,
        ),
        prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
        border: InputBorder.none,
        hintText: 'Search',
        hintStyle: TextStyle(color: tdGrey),
      ),
    ),
  );
}

}
