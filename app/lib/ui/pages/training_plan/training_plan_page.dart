import 'package:app/constants.dart';
import 'package:app/dev/dummy_api_provider.dart';
import 'package:app/models/data/training_plan.dart';
import 'package:app/ui/base/base_page/base_page.dart';
import 'package:app/ui/pages/training_plan/components/training_plan_header.dart';
import 'package:flutter/material.dart';

class TrainingPlanPage extends StatefulWidget {
  final String trainingPlanId;

  const TrainingPlanPage({Key? key, required this.trainingPlanId}) : super(key: key);

  @override
  State<TrainingPlanPage> createState() => _TrainingPlanPageState();
}

class _TrainingPlanPageState extends State<TrainingPlanPage> {
  late Future<TrainingPlan> futureTrainingPlan;

  @override
  void initState() {
    super.initState();
    futureTrainingPlan = _getTrainingPlan();
  }

  Future<TrainingPlan> _getTrainingPlan() async {
    return await POTDummyAPI.getPlan(widget.trainingPlanId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureTrainingPlan,
      builder: (context, AsyncSnapshot<TrainingPlan> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Text('No data');
          case ConnectionState.active:
          case ConnectionState.waiting:
            return const Text('Loading');
          case ConnectionState.done:
            if (snapshot.hasData) {
              return BasePage(
                header: true,
                customHeader: TrainingPlanHeader(trainingPlan: snapshot.data!),
                child: Padding(
                  padding: const EdgeInsets.only(top: 14.0),
                  child: Column(
                    children: [
                      Text(snapshot.data?.planName ?? 'Plan has no name', style: POTTextStyles.pageTitle,),
                    ],
                  ),
                ),
              );
            }
            return const Text('No data');
        }
      },
      
      );
  }
}