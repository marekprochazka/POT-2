import 'dart:math';

import 'package:app/models/data/base.dart';
import 'package:app/models/data/overload.dart';
import 'package:app/models/data/training.dart';

class TrainingActive extends BaseModel {
  final String trainingName;
  final List<Overload> overloads;

  TrainingActive({required id, required this.trainingName, required this.overloads  })
      : super(id: id);

  @override
  Future<void> save() async {
    print('$trainingName saved');
  }
  @override
  Future<void> destroy() async {
    print('$trainingName destroyed');
  }

  Future<void> finish() async {
    print('$trainingName finished');
  }
}