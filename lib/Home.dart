import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _count=0;

  incrementCount(){
    setState(() {
      _count++;
    });

    print(_count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Text(_count.toString(),style:TextStyle(fontSize: 40,color:Colors.black),),
      ),
      floatingActionButton: FloatingActionButton(onPressed: incrementCount,child: Icon(Icons.add),),
    );
  }
}
