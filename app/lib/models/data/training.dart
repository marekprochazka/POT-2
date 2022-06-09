import 'package:app/models/data/base.dart';
import 'package:app/models/data/exercise.dart';
import 'package:app/providers/api_provider.dart';
import 'package:app/utils/handle_api_call.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Training extends BaseModel{
  late String parentId;
  String? trainingName;  
  List<Exercise>? exercises;

  Training({required id, required this.parentId, this.trainingName, this.exercises, required String xCreated, required String xModified})
      : super(id: id, xCreated: xCreated, xModified: xModified);

  Training.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    parentId = json['parent_id'];
    trainingName = json['training_name'];
    exercises = (json['exercises'] as List)
        .map((e) => Exercise.fromJson(e))
        .toList();
  }

  static Future<Training?> getNew(BuildContext context, String planId) async {
    return await handleApiCall(context, 
    () => Provider.of<POTApiProvider>(context, listen: false).getNewTraining(planId));
  }

  Future<void> addNewExercise(BuildContext context) async {
    exercises ??= [];
    Exercise? newExerise = await Exercise.getNew(context, id);
    if (newExerise != null) {
      exercises!.add(newExerise);
    }
  }

  @override
  Future<void> save(BuildContext context) async {
    await handleApiCall(
        context,
        () => Provider.of<POTApiProvider>(context, listen: false)
            .updateTraining(parentId, this));
    if (exercises != null) {
      for (Exercise exercise in exercises! ) {
        await exercise.save(context);
      }
    }
  }

  @override
  Future<void> destroy(BuildContext context) async {
    return await handleApiCall(
        context,
        () =>
            Provider.of<POTApiProvider>(context, listen: false).deleteTraining(parentId, id));
  }
}