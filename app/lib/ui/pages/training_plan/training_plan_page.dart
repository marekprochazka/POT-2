import 'package:app/dev/dummy_api_provider.dart';
import 'package:app/models/data/training.dart';
import 'package:app/models/data/training_plan.dart';
import 'package:app/ui/pages/training_plan/components/training_plan_page_loaded/training_plan_page_loaded.dart';
import 'package:app/utils/loading_popup.dart';
import 'package:flutter/material.dart';

class TrainingPlanPage extends StatefulWidget {
  final String trainingPlanId;

  const TrainingPlanPage({Key? key, required this.trainingPlanId}) : super(key: key);

  @override
  State<TrainingPlanPage> createState() => _TrainingPlanPageState();
}

class _TrainingPlanPageState extends State<TrainingPlanPage> {
  late Future<TrainingPlan> futureTrainingPlan;
  late Future<List<Training>> futureTrainings;

  @override
  void initState() {
    super.initState();
    futureTrainingPlan = _getTrainingPlan();
    futureTrainings = _getTrainings();
  }

  Future<TrainingPlan> _getTrainingPlan() async {
    return await POTDummyAPI.getPlan(widget.trainingPlanId);
  }

  Future<List<Training>> _getTrainings() async {
    return await POTDummyAPI.getTrainings(widget.trainingPlanId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([futureTrainingPlan, futureTrainings]),
      builder: (context, AsyncSnapshot<List> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Text('No data');
          case ConnectionState.active:
          case ConnectionState.waiting:
            showLoadingPopup(context, 'Loading training plan...', freeze: false);
            return const SizedBox();
          case ConnectionState.done:
            if (snapshot.hasData) {
              hideLoadingPopup(context, freeze: false);
              return TrainingPlanPageLoaded(trainingPlan: snapshot.data![0], trainings: snapshot.data![1]);
            }
            return const Text('No data');
        }
      },
      
      );
  }
}