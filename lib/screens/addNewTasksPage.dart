import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/datalar/myTasksProvider.dart';

class AddNewTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            textCapitalization: TextCapitalization.sentences,
            autofocus: true,
            decoration: InputDecoration(
              filled: true,
              hintText: "Gorev Ekleyin",
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 3, color: Theme.of(context).accentColor),
              ),
            ),
            controller: Provider.of<MyTasksProvider>(context).taskController,
            onChanged: (value) {
              print(Provider.of<MyTasksProvider>(context, listen: false)
                  .taskController
                  .text);
            },
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Theme.of(context).accentColor),
          ),
          onPressed: () {
            if (Provider.of<MyTasksProvider>(context, listen: false)
                .taskController
                .text
                .isEmpty) {
              print("show dialog");
            } else {
              print("elsse");
              Provider.of<MyTasksProvider>(context, listen: false).addTask();
            }
            // Provider.of<AddNewTasksProvider>(context,listen: false).addTask();
            //  Do Something
            Provider.of<MyTasksProvider>(context, listen: false).getTask();
            Navigator.pop(context);
            //Burada snackbar goster
            Provider.of<MyTasksProvider>(context, listen: false).clearText();
          },
          child: Text("Ekle"),
        ),
      ],
    );
  }
}
