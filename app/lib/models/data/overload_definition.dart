

import 'package:app/models/data/base.dart';
import 'package:flutter/cupertino.dart';

class OverloadDefinition extends BaseModel {
  String? unit;
  String? dataType;

  OverloadDefinition({
    required String id,
    this.unit,
    this.dataType,
  }) : super(id: id);

  @override
  Future<void> save(BuildContext context) async {
    print('$unit saved');
  }
  
  @override
  Future<void> destroy(BuildContext context) async {
    print('$unit destroyed');
  }
}