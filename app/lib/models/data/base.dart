abstract class BaseModel {
  final String id;
  final String? xCreated;
  final String? xModified;
  BaseModel({required this.id, this.xCreated, this.xModified});
  BaseModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        xCreated = json['x_created'],
        xModified = json['x_modified'];

  Future<void> save();
  Future<void> destroy();
}