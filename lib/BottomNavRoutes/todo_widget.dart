import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

Map<String, bool> squareMap = {};

class TodoWidget extends StatefulWidget {
  const TodoWidget({Key? key}) : super(key: key);

  @override
  State<TodoWidget> createState() => TodoWidgetState();
}

//Luca pubblico task 57

int counter = 0;

class TodoWidgetState extends State<TodoWidget> {
  @override
  void initState() {
    counter = 0;
    squareMap = {
      "Row 1 Left": false,
      "Row 1 Right": false,
      "Row 2 Left": false,
      "Row 2 Right": false
    };
    super.initState();
  }

  void update(String value) {
    setState(() {
      squareMap[value] = true;
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: squareMap["Row 1 Left"] ?? false
                    ? Colors.blue
                    : Colors.greenAccent,
                child: GestureDetector(
                  onTap: () => update("Row 1 Left"),
                  child: Text("Text 1 Left: $counter"),
                ),
              ),
              const Text("Row 1 Right"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text("Row 2 Left"),
              Text("Row 2 Right"),
            ],
          ),
        ],
      ),
    );
  }
}
