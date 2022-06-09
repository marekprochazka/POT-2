import 'package:flutter/cupertino.dart';

class TrainingListState extends ChangeNotifier {
  TrainingListState();

  void notify() {
    notifyListeners();
  }
}