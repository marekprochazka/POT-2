import 'package:app/models/data/base.dart';
import 'package:app/models/data/training.dart';

class TrainingPlan extends BaseModel {
  String? planName;
  String? description;
  List<TrainingLite>? trainings;
  String? planImage;

  TrainingPlan(
      {required String id,
      this.planName,
      this.description,
      this.trainings,
      this.planImage,
      required String xCreated,
      required String xModified})
      : super(id: id, xCreated: xCreated, xModified: xModified);

  @override
  Future<void> save() async {
    print('$planName saved');
  }
}
