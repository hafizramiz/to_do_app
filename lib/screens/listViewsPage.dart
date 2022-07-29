import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/datalar/myTasksProvider.dart';

class ListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyTasksProvider>(
      builder: (context, nesne3, child) => ListView.builder(
        itemCount: nesne3.taskList.length,
        itemBuilder: (_, index) => Dismissible(
          direction: DismissDirection.horizontal,
          key: UniqueKey(),
          onDismissed: (DismissDirection direction) {
            nesne3.removeTask(index);
          },
          background: Container(
            color: Colors.red,
            child: Row(
              children: [
                Icon(Icons.delete, color: Colors.white),
                Text(
                  ("Sil"),
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          child: Card(
            elevation: 10,
            shadowColor: Theme.of(context).accentColor,
            child: ListTile(
              trailing: Consumer<MyTasksProvider>(
                builder: (context, nesne1, child) => Checkbox(
                  value: nesne1.taskList[index].taskStatus,
                  onChanged: (newValue) {
                    nesne1.setTaskStatus(index);
                  },
                ),
              ),
              title: Consumer<MyTasksProvider>(
                builder: (context, nesne2, child) => Text(
                  "${nesne2.taskList[index].taskName}",
                  style: nesne2.taskList[index].taskStatus
                      ? TextStyle(decoration: TextDecoration.lineThrough)
                      : null,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
