import 'package:app/models/data/base.dart';

class Overload extends BaseModel {
  String? value;
  final String exerciseName;
  final String exerciseId;
  final String overloadUnit;
  final double? defaultAddOverloadValue;

  Overload(
      {required String id,
      this.value,
      required this.exerciseName,
      required this.exerciseId,
      required this.overloadUnit,
      this.defaultAddOverloadValue})
      : super(id: id);

  @override
  Future<void> save() async {
    print('$exerciseName saved');
  }
  @override
  Future<void> destroy() async {
    print('$exerciseName destroyed');
  }
}