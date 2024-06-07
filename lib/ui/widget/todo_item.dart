import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_application/entities/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final VoidCallback onIconButtonPressed;

  const TodoItem({
    super.key,required this.todo,required this.onIconButtonPressed
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 4),
      surfaceTintColor: _getCardTintColor(todo.isDone),
      color: _getCardBGColor(todo.isDone),
      child:  ListTile(
        title: Text(todo.title,style: TextStyle(
          decoration: _getTextDecoration(todo.isDone),
          fontSize: 16,
         fontWeight: FontWeight.w600
        ),),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(todo.description),
            Text(DateFormat.yMMMMEEEEd().add_jms().format(todo.time)),
          ],
        ),
        trailing: _buildRoundedIconButton(todo.isDone),
      ),
    );
  }

  Widget _buildRoundedIconButton(bool isDone){
    return GestureDetector(
      onTap: onIconButtonPressed,
      child: CircleAvatar(
          child: Icon(_getIcon(!todo.isDone)),
    ),
    );
  }

  IconData _getIcon(bool isDone){
    return isDone ? Icons.check : Icons.close;
  }

  TextDecoration ? _getTextDecoration(bool isDone){
    return isDone ? TextDecoration.lineThrough : null;
  }

  //isDone kina eita check korbe//method baniye kaj kora
Color ? _getCardTintColor (bool isDone){

  return isDone ? Colors.green : null;}
  
Color ? _getCardBGColor (bool isDone){
    return isDone ? Colors.greenAccent.shade200 : null;
}  

}