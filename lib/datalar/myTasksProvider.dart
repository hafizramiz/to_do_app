import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'myTask.dart';

class MyTasksProvider extends ChangeNotifier {
  //Burada gorevlerden olusan bir liste bir veritabani olusturdum ve bunu yayinladim
  TextEditingController taskController = TextEditingController();
  bool taskStatus = false;
  List<Task> taskList = [];

  // Bu Listeyi Shared Prefe kayd edecem
  List<String> stingListe = [];

  void addTask() {
    Task task = Task(taskName: taskController.text, taskStatus: taskStatus);
    taskList.add(task);
    saveTask();
    notifyListeners();
  }

  saveTask() async {
    stingListe.clear();
    for (Task item in taskList) {
      stingListe.add(json.encode(item.toMap()));
    }
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList("taskList", stingListe);
    notifyListeners();
  }

  void getTask() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> readStringListe = prefs.getStringList("taskList") ?? [];
    taskList.clear();
    for (String item in readStringListe) {
      taskList.add(Task.FromMapToObject(json.decode(item)));
    }
    notifyListeners();
  }

  setTaskStatus(index) {
    taskList[index].changeStatus();
    saveTask();
    notifyListeners();
  }

  void removeTask(index) {
    taskList.removeAt(index);
    saveTask();
    notifyListeners();
  }

  MyTasksProvider() {
    getTask();
  }

  clearText() {
    taskController.clear();
  }
}
