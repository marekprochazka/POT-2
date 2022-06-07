

import 'package:app/models/data/base.dart';

class OverloadDefinition extends BaseModel {
  String? unit;
  String? dataType;

  OverloadDefinition({
    required String id,
    this.unit,
    this.dataType,
  }) : super(id: id);

  @override
  Future<void> save() async {
    print('$unit saved');
  }
  
  @override
  Future<void> destroy() async {
    print('$unit destroyed');
  }
}