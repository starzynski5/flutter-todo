import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Todo App',
    home: Home(),
  ));
}

class Task{
  static int _counter = 0;

  int id = 0;

  String text = "";

  Task(_text){
    id = ++_counter;
    text = _text;
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Task> tasks = [];
  TextEditingController _task = TextEditingController();

  void addTask(){
    Task task = Task(_task.text);

    setState(() {
      tasks.add(task);
    });
  }

  void deleteTask(int id){
    setState(() {
      tasks.removeWhere((task) => task.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            style: TextStyle(fontFamily: 'Arial', fontSize: 20),
            controller: _task,
            decoration: InputDecoration(
              labelText: 'Enter your task',
              border: OutlineInputBorder(),
              
            ),
          ),

          ListView(
            shrinkWrap: true,
            children: tasks.map((task) => ListTile(
              title: Text('${task.id} - ${task.text}'),
              trailing: IconButton(onPressed: () => deleteTask(task.id), icon: Icon(Icons.delete_outlined)),
            )).toList(),
          ),

          ElevatedButton(
            onPressed: addTask,
            child: Text('Add Task'),
          ),
        ],
      ),
    );
  }
}
