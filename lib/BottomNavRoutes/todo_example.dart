import 'dart:html';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'counter_example.dart';

class ToDoList extends StatefulWidget{
  @override
  State<ToDoList> createState() => _ToDoList();
  }

class _ToDoList extends State<ToDoList>{


  final sampleList = [];

  int _counter = 0;
  void removeItem(int index) {
    setState(() {
      sampleList.removeAt(index);
    });
  }

  void decreaseCounter() {
    setState(() {
      if (_counter > 0) _counter--;
    });
  }

  void resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void addSmthToList() {
    setState(() {
      sampleList.add(WordPair.random().asCamelCase);
    });
  }

  void resetList() {
    setState(() {
      sampleList.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(onPressed: resetList, child: Icon(Icons.restart_alt_sharp),),
          SizedBox(
            width: 15,
          ),
          FloatingActionButton(onPressed: addSmthToList, child: Icon(Icons.add_box),),

        ],
      ),
      body:
      ListView.builder(
    itemCount: sampleList.length,
    itemBuilder: (context, index) {
      return Padding(padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Column(
      children: [
        ListTile(
      title: Text(
      sampleList[index],
        style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
      ),
        leading: Icon(Icons.account_circle),
        subtitle: Text("Impegno N.$index"),
        dense: false,
        onTap: (() {}),
        tileColor: Colors.deepPurple[50],
        trailing: Wrap(
          children: <Widget>[
            IconButton(onPressed:  (() => removeItem(index)), icon: Icon(Icons.crop_square_rounded),),
          ],
        ),
        hoverColor: Colors.red,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7))),
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 10),
        //   child: Divider(
        //     thickness: 2,
        //   ),
        // )
      ],
      ),
      );
    }),
    );
  }
}
