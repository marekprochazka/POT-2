import 'package:app/models/data/training.dart';
import 'package:app/ui/pages/training_plan/components/training_plan_page_loaded/components/trainings_list_item.dart';
import 'package:flutter/cupertino.dart';

class TrainingsList extends StatelessWidget {
  final List<Training> trainings;

  const TrainingsList({ Key? key, required this.trainings }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      child: ListView.builder(
        itemCount: trainings.length,
        itemBuilder: (context, index) => TrainingsListItem(training: trainings[index]),
      ),
    );
  }
}