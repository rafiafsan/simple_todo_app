import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List <String> task = [];
  TextEditingController _taskcontroller = TextEditingController();

  _addTask(){
    if(_taskcontroller.text.isNotEmpty){
      setState(() {
        task.add(_taskcontroller.text);
        _taskcontroller.clear();
      });
    }
  }

  _removeTask(int index){
      setState(() {
        task.removeAt(index);
      });
  }

  _removeall(){
    setState(() {
      task.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Simple Todo List",
          style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _taskcontroller,
              decoration: InputDecoration(
                  hintText: "Enter Your Task",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  suffixIcon:
                      IconButton(onPressed: _addTask, icon: Icon(Icons.add))),
            ),
            SizedBox(),
            
            Expanded(
              child: ListView.builder(
                  itemCount: task.length,
                  itemBuilder: (Context, index) {
                    return Card(
                      child: ListTile(
                        title:Text(task[index]),
                        trailing: IconButton(onPressed: ()=>_removeTask(index), icon:Icon(Icons.delete,color: Colors.red,)),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed:_removeall, backgroundColor:Colors.greenAccent, child: Icon(Icons.clear_all, color: Colors.black45,),),
    );
  }
}
