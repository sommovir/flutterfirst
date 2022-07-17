// ignore_for_file: prefer_const_constructors

import 'package:english_words/english_words.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

int counter = 0;

class CounterSample extends StatefulWidget {
  @override
  State<CounterSample> createState() => _CounterSampleState();
}

class _CounterSampleState extends State<CounterSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
              onPressed: increaseCounter, child: const Icon(Icons.add)),
          const SizedBox(width: 10),
          FloatingActionButton(
              onPressed: decreaseCounter, child: const Icon(Icons.remove)),
          const SizedBox(width: 10),
          FloatingActionButton(
              onPressed: resetCounter, child: const Icon(Icons.restart_alt)),
        ],
      ),
      body: counterLogic(),
    );
  }

  void increaseCounter() {
    setState(() {
      counter++;
    });
  }

  void decreaseCounter() {
    setState(() {
      counter--;
    });
  }

  void resetCounter() {
    setState(() {
      counter = 0;
    });
  }
}

class counterLogic extends StatefulWidget {
  @override
  State<counterLogic> createState() => _counterLogicState();
}

class _counterLogicState extends State<counterLogic> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Text(
              "Counter value:",
              style: TextStyle(fontSize: 30),
            ),
          ),
          Text(
            "$counter",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
