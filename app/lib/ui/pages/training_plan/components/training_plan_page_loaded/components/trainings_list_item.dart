import 'package:app/constants.dart';
import 'package:app/models/data/training.dart';
import 'package:flutter/material.dart';

class TrainingsListItem extends StatelessWidget {
  final Training training;

  const TrainingsListItem({ Key? key, required this.training }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('${training.trainingName} id:${training.id}', style: POTTextStyles.dynamicText(15, FontWeight.normal, POTColors.primary),),
    );
  }
}