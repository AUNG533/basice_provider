import 'package:flutter/material.dart';

class Todo with ChangeNotifier {
  final List<String> _tasks = [];
  List<String> get tasks => List.unmodifiable(_tasks);

  // add a task to the list
  void add(String text) {
    _tasks.add(text);
    notifyListeners();
  }

  // edit a task in the list
  void edit(int index, newText) {
    _tasks[index] = newText;
    notifyListeners();
  }

  // delete a task from the list
  void delete(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

}