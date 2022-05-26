

import 'package:flutter/cupertino.dart';

class IsFrozenState extends ChangeNotifier {
  bool _isFrozen = false;

  IsFrozenState() {
    isFrozen = false;
  }

  bool get isFrozen => _isFrozen;
  set isFrozen(bool value) {
    _isFrozen = value;
    notifyListeners();
  }

}