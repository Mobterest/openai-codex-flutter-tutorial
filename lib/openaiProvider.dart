import 'package:flutter/material.dart';

class OpenAIProvider extends ChangeNotifier {
  final List<String> _history = [];

  List<String> get history => _history;

  void addToHistory(String completion) {
    _history.add(completion);
    notifyListeners();
  }

  void setHistory(int newIndex, String item) {
    _history.insert(newIndex, item);
    notifyListeners();
  }

  String removeHistory(int oldIndex) {
    return _history.removeAt(oldIndex);
  }

  void deleteHistory(String item) {
    _history.remove(item);
    notifyListeners();
  }
}
