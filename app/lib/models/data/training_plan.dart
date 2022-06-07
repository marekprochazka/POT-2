import 'package:app/models/data/base.dart';
import 'dart:math';

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

  
  static Future<TrainingPlan> getNew() async {
    Random random = Random();
    return TrainingPlan(
      id: '${random.nextInt(1000000)}',
      xCreated: DateTime.now().toIso8601String(),
      xModified: DateTime.now().toIso8601String(),
    );
  }

  @override
  Future<void> save() async {
    print('$planName saved');
  }

  @override
  Future<void> destroy() async {
    print('$planName destroyed');
  }
}
