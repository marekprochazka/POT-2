import 'dart:math';

import 'package:app/models/data/base.dart';
import 'package:app/models/data/exercise.dart';
import 'package:flutter/cupertino.dart';

class TrainingLite {
  final String id;
  final String name;

  TrainingLite({required this.id, required this.name});
}

class Training extends BaseModel{
  String? trainingName;  
  List<Exercise>? exercises;

  Training({required id, this.trainingName, this.exercises, required String xCreated, required String xModified})
      : super(id: id, xCreated: xCreated, xModified: xModified);

  static Future<Training> getNew() async {
    Random random = Random();
    return Training(
      id: '${random.nextInt(1000000)}',
      xCreated: DateTime.now().toIso8601String(),
      xModified: DateTime.now().toIso8601String(),
    );
  }

  Future<void> addNewExercise() async {
    exercises ??= [];
    exercises!.add(await Exercise.getNew());
  }

  @override
  Future<void> save(BuildContext context) async {
    print('$trainingName saved');
  }

  @override
  Future<void> destroy(BuildContext context) async {
    print('$trainingName destroyed');
  }
}