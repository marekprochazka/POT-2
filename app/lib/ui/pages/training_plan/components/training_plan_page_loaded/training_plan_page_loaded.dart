import 'package:app/constants.dart';
import 'package:app/models/data/training.dart';
import 'package:app/models/data/training_plan.dart';
import 'package:app/ui/base/base_page/base_page.dart';
import 'package:app/ui/pages/training_plan/components/training_plan_header.dart';
import 'package:app/ui/pages/training_plan/components/training_plan_page_loaded/components/trainings_list.dart';
import 'package:flutter/material.dart';

class TrainingPlanPageLoaded extends StatelessWidget {
  final TrainingPlan trainingPlan;
  final List<Training> trainings;

  const TrainingPlanPageLoaded({ Key? key, required this.trainingPlan, required this.trainings }) : super(key: key);

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
                      TrainingsList(trainings: trainings)
                    ],
                  ),
                ),
              );
  }
}