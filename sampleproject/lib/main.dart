// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue, brightness: Brightness.light)),
      home: HomeView(title: 'Bruh ew'),
    );
  }
}

class HomeView extends StatefulWidget {
  final String title;

  HomeView({required this.title});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _counter = 0;

  var colors = [
    Colors.blue,
    Colors.grey,
    Colors.lightGreen,
    Colors.orangeAccent,
    Colors.redAccent
  ];

  void increaseCounter() {
    setState(() {
      _counter++;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Icon(Icons.menu),
          backgroundColor: Colors.transparent,
          title: Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              labelTextStyle: MaterialStateProperty.all(
                  TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
          child: NavigationBar(destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
            NavigationDestination(icon: Icon(Icons.people), label: 'Friends'),
            NavigationDestination(
                icon: Icon(Icons.meeting_room), label: 'Meet'),
          ]),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
                onPressed: resetCounter, child: Icon(Icons.restart_alt)),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
                onPressed: decreaseCounter, child: Icon(Icons.remove)),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
                onPressed: increaseCounter, child: Icon(Icons.add)),
          ],
        ),
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Text("You tapped this many times:",
                      style: TextStyle(fontSize: 20)),
                ),
                Row(
                  children: [
                    Text('$_counter',
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold)),
                    Text("Bruh"),
                  ],
                ),
                ElevatedButton(
                    onPressed: resetCounter, child: Text("Bruh prova")),
              ],
            ),
          ),
        ));
  }
}
