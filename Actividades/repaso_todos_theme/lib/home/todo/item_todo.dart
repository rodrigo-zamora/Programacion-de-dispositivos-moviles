import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/todos_bloc.dart';

class ItemTodo extends StatelessWidget {
  final String todoDescription;
  final bool isChecked;

  final int itemAt;
  ItemTodo(
      {Key? key,
      required this.todoDescription,
      this.isChecked = false,
      required this.itemAt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(todoDescription),
      secondary: IconButton(
        onPressed: () {
          BlocProvider.of<TodosBloc>(context).add(
            DeleteTodoEvent(index: itemAt),
          );
        },
        icon: Icon(Icons.delete_forever),
      ),
      value: isChecked,
      onChanged: (newValue) {
        BlocProvider.of<TodosBloc>(context).add(
          DoneTodoEvent(index: itemAt),
        );
      },
    );
  }
}
