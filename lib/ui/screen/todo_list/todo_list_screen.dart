import 'package:flutter/material.dart';
import 'package:to_do_application/entities/todo.dart';
import 'package:to_do_application/ui/screen/add_new_todo_screen.dart';
import 'package:to_do_application/ui/screen/todo_list/all_todo_list_tab.dart';
import 'package:to_do_application/ui/screen/todo_list/done_todo_list_tab.dart';
import 'package:to_do_application/ui/screen/todo_list/undone_todo_list_tab.dart';

class TodoListScreen extends StatefulWidget{
  const TodoListScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TodoListScreenState();
  }

}

class _TodoListScreenState extends State<TodoListScreen>
    with SingleTickerProviderStateMixin{
  final List<Todo> _todoList = [];

  //TabBarController dorkar
  //late TabController _tabController;

@override
  void initState(){
  super.initState();
  //_tabController = TabController(length: 3, vsync: this);

}

  @override
  Widget build(BuildContext context) {

      return DefaultTabController(length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Todo List'),
              bottom: _buildTabBar(),
            ),
            body: TabBarView(
              //controller: _tabController,
              children: [
                AllTodoListTab(onDelete: (int index) {
                  _deleteTodo(index);
                  },
                  onStatusChange: (int index) {
                  _toggleTodoStatus(index);},
                  todoList: _todoList
                ),

                UndoneTodoListTab(onDelete: (int index) {
                  _deleteTodo(index);
                  },
                  onStatusChange: (int index ) {
                  _toggleTodoStatus(index);
                  },
                  todoList: _todoList.where((item) => item.isDone == false).toList(),
                ),
                DoneTodoListTab(
                    onDelete: (int index) {
                      _deleteTodo(index);
                    },
                    onStatusChange: (int index ) {
                      _toggleTodoStatus(index);
                    },
                    todoList: _todoList.where((item) => item.isDone == true).toList()
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton.extended(

              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                AddNewTodoScreen(onAddTodo: _addNewTodo,))
                );
              },
              tooltip: 'Add new todo',
              label: const Text('Add'),
              icon: const Icon(Icons.add),
            ),
          ),
      );
  }

  TabBar _buildTabBar() {
    return const TabBar(
            //  controller: _tabController,
              tabs: [
                Tab(text: 'All',),
                Tab(text: 'Undone',),
                Tab(text: 'Done',)
              ],
            );
  }

  void _addNewTodo(Todo todo){
     _todoList.add(todo);

     if(mounted) {
       setState(() {
         //dirty state theke beriye ashte state change korte hobe});
         });
  }
}

void _deleteTodo(int index){

         _todoList.removeAt(index);  //je index ta niye ashse
         if(mounted){  //current screen ta active ache kina
           setState(() {});
         }
}

//done korte pari undone korte pari

void _toggleTodoStatus(int index){
  _todoList[index].isDone = !_todoList[index].isDone;
  if(mounted){
    setState(() {

    });
  }

}



}

