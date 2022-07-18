import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ListManager extends StatefulWidget {
  @override
  State<ListManager> createState() => _ListManagerState();
}

class _ListManagerState extends State<ListManager> {
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
          FloatingActionButton(
              onPressed: resetList, child: const Icon(Icons.restart_alt)),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
              onPressed: addSmthToList, child: const Icon(Icons.add)),
        ],
      ),
      body: ListView.builder(
          itemCount: sampleList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      sampleList[index],
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                    ),
                    leading: const Icon(Icons.home_filled),
                    subtitle: Text("$index"),
                    dense: false,
                    onTap: (() {}),
                    tileColor: Colors.deepPurple[50],
                    trailing: const Icon(Icons.menu),
                    onLongPress: (() => removeItem(index)),
                    shape: const RoundedRectangleBorder(
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
