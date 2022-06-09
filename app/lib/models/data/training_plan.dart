import 'package:app/models/data/base.dart';
import 'package:app/providers/api_provider.dart';
import 'package:app/utils/handle_api_call.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class TrainingPlan extends BaseModel {
  String? planName;
  String? description;
  String? planImage;

  TrainingPlan(
      {required String id,
      this.planName,
      this.description,
      this.planImage,
      required String xCreated,
      required String xModified})
      : super(id: id, xCreated: xCreated, xModified: xModified);

  TrainingPlan.fromJson(Map<String, dynamic> json)
      : planName = json['plan_name'],
        description = json['description'],
        planImage = json['plan_image'] ?? json['default_image'],
        super.fromJson(json);

  static Future<TrainingPlan?> getNew(BuildContext context) async {
    return await handleApiCall(context,
        () => Provider.of<POTApiProvider>(context, listen: false).getNewPlan());
  }

  @override
  Future<void> save(BuildContext context) async {
    return await handleApiCall(
        context,
        () => Provider.of<POTApiProvider>(context, listen: false)
            .updatePlan(this));
  }

  @override
  Future<void> destroy(BuildContext context) async {
    return await handleApiCall(
        context,
        () =>
            Provider.of<POTApiProvider>(context, listen: false).deletePlan(id));
  }
}
