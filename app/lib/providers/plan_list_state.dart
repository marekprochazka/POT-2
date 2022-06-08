


import 'package:flutter/cupertino.dart';

class PlanListState extends ChangeNotifier {
  bool _isCurrent = false;

  PlanListState({bool isCurrent = false}) {
    _isCurrent = isCurrent;
  }

  bool get isCurrent => _isCurrent;
  set isCurrent(bool value) {
    _isCurrent = value;
    notifyListeners();
  }
}