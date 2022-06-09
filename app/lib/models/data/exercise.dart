import 'package:app/models/data/base.dart';
import 'package:app/models/data/overload_definition.dart';
import 'package:app/providers/api_provider.dart';
import 'package:app/utils/handle_api_call.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Exercise extends BaseModel {
  late String parentId;
  String? exerciseName;
  OverloadDefinition overloadDefinition;
  int? order;
  String? description;
  double? defaultAddOverloadValue;
  String? lastOverloadValue;

  Exercise({
    required String id,
    required this.parentId,
    this.exerciseName,
    required this.overloadDefinition,
    this.order,
    this.description,
    this.defaultAddOverloadValue,
    this.lastOverloadValue,
    String? xCreated,
    String? xModified,
  }) : super(id: id, xCreated: xCreated, xModified: xModified);

  Exercise.fromJson(Map<String, dynamic> json)
      : parentId = json['parent_id'],
        exerciseName = json['exercise_name'],
        overloadDefinition = OverloadDefinition.fromJson(json['overload_definition']),
        order = json['order'],
        description = json['description'],
        defaultAddOverloadValue = json['default_add_overload_value'],
        lastOverloadValue = json['last_overload_value'],
        super.fromJson(json);

  static Future<Exercise?> getNew(BuildContext context, String trainingId) async {
    return await handleApiCall(context, 
    () => Provider.of<POTApiProvider>(context, listen: false).getNewExercise(trainingId));
  }

  @override
  Future<void> save(BuildContext context) async {
    return await handleApiCall(
        context,
        () => Provider.of<POTApiProvider>(context, listen: false)
            .updateExercise(parentId, this));
  }

  @override
  Future<void> destroy(BuildContext context) async {
    return await handleApiCall(
        context,
        () => Provider.of<POTApiProvider>(context, listen: false)
            .deleteExercise(parentId, id));
  }

}