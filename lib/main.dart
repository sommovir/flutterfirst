// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sampleproject/BottomNavRoutes/counter_example.dart';
import 'package:sampleproject/BottomNavRoutes/fetch_data_account.dart';
import 'package:sampleproject/BottomNavRoutes/list_example.dart';
import 'package:sampleproject/BottomNavRoutes/todo_example.dart';

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
          //textTheme: GoogleFonts.latoTextTheme(),
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue, brightness: Brightness.light)),
      home: HomeView(title: 'Flutter Examples'),
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
  final List<Widget> widgetList = [
    CounterSample(),
    ListManager(),
    ToDoList(),
    JsonListResponse(),
    Center(child: Text("TODO")),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
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
        child: NavigationBar(
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) => setState(() {
            selectedIndex = index;
          }),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Counter'),
            NavigationDestination(icon: Icon(Icons.search), label: 'List'),
            NavigationDestination(icon: Icon(Icons.people), label: 'To do'),
            NavigationDestination(
                icon: Icon(Icons.accessible_sharp), label: 'GET JSON'),
            NavigationDestination(
                icon: Icon(Icons.meeting_room), label: 'TODO'),
          ],
        ),
      ),

      body: widgetList[selectedIndex],
    );
  }
}
