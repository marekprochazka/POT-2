import 'package:app/constants.dart';
import 'package:app/models/data/training_plan.dart';
import 'package:app/ui/base/base_page/base_page.dart';
import 'package:app/ui/pages/training_plan/components/training_plan_header.dart';
import 'package:flutter/material.dart';

class TrainingPlanPageLoaded extends StatelessWidget {
  final TrainingPlan trainingPlan;

  const TrainingPlanPageLoaded({ Key? key, required this.trainingPlan }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
                header: true,
                customHeader: TrainingPlanHeader(trainingPlan: trainingPlan),
                child: Padding(
                  padding: const EdgeInsets.only(top: 14.0),
                  child: Column(
                    children: [
                      Text('${trainingPlan.planName} id:${trainingPlan.id}', style: POTTextStyles.pageTitle,),
                    ],
                  ),
                ),
              );
  }
}