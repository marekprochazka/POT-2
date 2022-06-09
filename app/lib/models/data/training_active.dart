import 'package:app/models/data/base.dart';
import 'package:app/models/data/overload.dart';
import 'package:app/providers/api_provider.dart';
import 'package:app/utils/handle_api_call.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class TrainingActive extends BaseModel {
  final String trainingName;
  final String trainingId;
  final List<Overload> overloads;

  TrainingActive(
      {required id,
      required this.trainingName,
      required this.trainingId,
      required this.overloads})
      : super(id: id);

  factory TrainingActive.fromJson(Map<String, dynamic> json) {
    return TrainingActive(
      id: json['id'],
      trainingName: json['training_name'],
      trainingId: json['training_id'],
      overloads: (json['overloads'] as List<dynamic>)
          .map((e) => Overload.fromJson(e))
          .toList(),
    );
  }

  static Future<TrainingActive?> getLast(
      BuildContext context, String trainingIdParam) async {
    return await handleApiCall(
        context,
        () => Provider.of<POTApiProvider>(context, listen: false)
            .getLastTrainingActive(trainingIdParam));
  }

  @override
  Future<void> save(BuildContext context) async {}
  @override
  Future<void> destroy(BuildContext context) async {}

  Future<void> writeOverload(BuildContext context) async {
    List<Map<String, dynamic>> body = overloads.expand((overload) => [
      if (overload.value != null) {'exercise_id':overload.exerciseId, 'value':double.parse(overload.value.toString())}
    ]).toList();
    await handleApiCall(
      context,
      () => Provider.of<POTApiProvider>(context, listen: false)
          .setMultipleOverloads(id, body),
    );
  }

  Future<void> finish(BuildContext context) async {
    await handleApiCall(
      context,
      () => Provider.of<POTApiProvider>(context, listen: false)
          .finishTrainingActive(id),
    );
  }
}
