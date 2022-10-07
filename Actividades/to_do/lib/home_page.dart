// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/to_do_bloc/bloc/to_do_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do list'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'TO DO',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 250,
                      //height: 50,
                      child: TextField(
                        controller: _textFieldController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          labelText: 'Contenido del To-Do',
                          labelStyle: TextStyle(
                            fontSize: 12,
                          ),
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(25),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.backspace,
                              size: 40,
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<ToDoBloc>(context).add(
                              AddToDoEvent(
                                toDo: _textFieldController.text,
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.download,
                            size: 40,
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Por realizar",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Expanded(
              child: _buildToDo(),
            ),
          ],
        ),
      ),
    );
  }

  BlocConsumer<ToDoBloc, ToDoState> _buildToDo() {
    return BlocConsumer<ToDoBloc, ToDoState>(
      listener: (context, ToDoState state) {},
      builder: (context, ToDoState state) {
        return ListView.builder(
          itemCount: 3,
          itemBuilder: (
            BuildContext context,
            int index,
          ) {
            return ListTile(
              title: Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (state) {
                      setState(() {});
                    },
                  ),
                  Text('To-Do'),
                  SizedBox(
                    width: 30,
                  ),
                  Icon(
                    Icons.delete_forever,
                    size: 40,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
