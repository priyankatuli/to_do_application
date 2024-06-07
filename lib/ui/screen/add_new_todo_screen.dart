import 'package:flutter/material.dart';
import 'package:to_do_application/entities/todo.dart';

class AddNewTodoScreen extends StatefulWidget{
  const AddNewTodoScreen({super.key, required this.onAddTodo});


  //todo ta niye jabe call back function r maddome

  final Function(Todo) onAddTodo;



  @override
  State<StatefulWidget> createState() {

    return _AddNewTodoStateScreen();
  }

}

class _AddNewTodoStateScreen extends State<AddNewTodoScreen>{
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleTEController,
                decoration: const InputDecoration(
                    labelText: 'Title',
                    hintText: 'Title'
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (String ? value){
                   if(value?.trim().isEmpty ?? true){
                       return 'Enter your title';
                   }
                   return null;
                },
              ),
              const SizedBox(height: 8,),
              TextFormField(
                controller: _descriptionTEController,
                decoration: const InputDecoration(
                    labelText: 'Description',
                    hintText: 'Description'
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                maxLength: 200,
                validator: (String ? value){
                  if(value ?.trim().isEmpty?? true){
                    return 'Enter your description';
              }
                  return null;
              },
              ),
              const SizedBox(height: 16,),
              ElevatedButton(onPressed: (){
                if(_formkey.currentState!.validate()){

                  Todo todo = Todo(_titleTEController.text.trim(), _descriptionTEController.text.trim(), DateTime.now());
                  widget.onAddTodo(todo);
                        Navigator.pop(context);
                }
              }, child: const Text('Add'))
            ],
          ),
        )
      ),
    );

  }

  @override
  void dispose(){
    super.dispose();
    _titleTEController.dispose();
    _descriptionTEController.dispose();


  }

}