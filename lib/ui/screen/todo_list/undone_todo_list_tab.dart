
import 'package:flutter/material.dart';
import 'package:to_do_application/entities/todo.dart';
import 'package:to_do_application/ui/widget/empty_list_widget.dart';
import 'package:to_do_application/ui/widget/todo_item.dart';

class UndoneTodoListTab extends StatelessWidget{
  const UndoneTodoListTab({super.key, required this.onDelete, required this.onStatusChange, required this.todoList});


  final Function(int) onDelete;
  final Function(int) onStatusChange;
  final List<Todo> todoList;


  @override
  Widget build(BuildContext context) {

    if(todoList.isEmpty){
      return const EmptyListWidget();
    }
       return ListView.builder(
         itemBuilder: (BuildContext context, int index) {
           return Dismissible(key: UniqueKey(),
               onDismissed: (_){
             onDelete(index);
               },
               child: TodoItem(
                 todo: todoList[index],
                 onIconButtonPressed: () {
                   onStatusChange(index);
                 },
               ));
         },
         itemCount: todoList.length,

       );
  }

}