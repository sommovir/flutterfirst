import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TodoWidget extends StatefulWidget {
  const TodoWidget({Key? key}) : super(key: key);

  @override
  State<TodoWidget> createState() => TodoWidgetState();
}

class TodoWidgetState extends State<TodoWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          child: Container(
            color: Colors.red,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    child: Container(
                        color: Colors.blue, child: Text("CELLA 0, 0"))),
                Flexible(
                    child: Container(
                        color: Colors.amber, child: Text("CELLA 0, 1"))),
              ],
            ),
          ),
        ),
        Row(
          children: [
            Text("CELLA 1, 0"),
            Text("CELLA 1, 1"),
          ],
        ),
      ],
    );
  }
}
