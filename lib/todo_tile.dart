import 'package:flutter/material.dart';

class TodoTile extends StatefulWidget {
  final String todo;
  final bool isDone;
  final int index;
  final String date;
  final Function(bool) onDoneChanged;
  final Function(int index) delete;
  const TodoTile(
      {super.key,
      required this.isDone,
      required this.todo,
      required this.onDoneChanged,
      required this.delete,
      required this.index,
      required this.date});

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.90,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.yellow, borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Checkbox(
                    value: widget.isDone,
                    onChanged: (value) {
                      setState(() {
                        widget.onDoneChanged(value!);
                      });
                      print(value);
                    },
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.todo,
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(widget.date)
                    ],
                  )
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  widget.delete(widget.index);
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ))
          ],
        ),
      ),
    );
  }
}
