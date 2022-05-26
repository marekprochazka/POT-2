abstract class BaseModel {
  final String id;
  final String xCreated;
  final String xModified;
  BaseModel({required this.id, required this.xCreated, required this.xModified});

  Future<void> save();
  Future<void> destroy();
}