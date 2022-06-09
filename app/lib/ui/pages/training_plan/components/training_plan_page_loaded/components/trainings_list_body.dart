import 'package:app/constants.dart';
import 'package:app/models/data/exercise.dart';
import 'package:app/models/data/training.dart';
import 'package:app/ui/pages/training_plan/components/training_plan_page_loaded/components/edit_training_form.dart';
import 'package:app/ui/pages/training_plan/components/training_plan_page_loaded/components/write_overload_form.dart';
import 'package:app/ui/shared/buttons/pot_button.dart';
import 'package:app/ui/shared/expansion_panel/pot_expansion_panel.dart';
import 'package:flutter/material.dart';

class TrainingsListBody extends StatelessWidget {
  final List<Training> trainings;
  const TrainingsListBody({Key? key, required this.trainings})
      : super(key: key);

  double countBodyHeight(int trainingIndex) =>
      ((trainings[trainingIndex].exercises?.length ?? 0) * 25.0) + 30.0;

  Exercise getExercise(int trainingIndex, int exerciseIndex) {
    return trainings[trainingIndex].exercises![exerciseIndex];
  }

  String generateExerciseString(int trainingIndex, int exerciseIndex) {
    final exercise = getExercise(trainingIndex, exerciseIndex);
    String exerciseName = exercise.exerciseName ?? '';
    String excerciseDescription =
        exercise.description != null ? '(${exercise.description})' : '';
    String lastOverloadValue = exercise.lastOverloadValue ?? '';
    return '$exerciseName $excerciseDescription - $lastOverloadValue';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.55,
        child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (notification) {
              notification.disallowIndicator();
              return false;
            },
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              itemCount: trainings.length,
              itemBuilder: (context, trainingIndex) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: POTExpansionPanel(
                    headerHeight: 50.0,
                    bodyHeight: countBodyHeight(trainingIndex),
                    headerChild: Text(
                      trainings[trainingIndex].trainingName!,
                      style: POTTextStyles.dynamicText(
                          18, FontWeight.bold, POTColors.white),
                    ),
                    bodyChild: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: IgnorePointer(
                            ignoring: true,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount:
                                  trainings[trainingIndex].exercises?.length ??
                                      0,
                              itemBuilder: (context, exerciseIndex) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          generateExerciseString(
                                              trainingIndex, exerciseIndex),
                                          style: POTTextStyles
                                              .excerciseDescription,
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                POTButton(
                                    width: 130,
                                    height: 25,
                                    text: 'Write overload',
                                    textStyle: POTTextStyles.dynamicText(
                                        13, FontWeight.bold, POTColors.white),
                                    callback: () {
                                      showWriteOverloadForm(
                                          context, trainings[trainingIndex].id);
                                    }),
                                const Spacer(),
                                POTButton(
                                    width: 130,
                                    height: 25,
                                    text: 'Training settings',
                                    textStyle: POTTextStyles.dynamicText(
                                        13, FontWeight.bold, POTColors.white),
                                    callback: () {
                                      editTrainingForm(
                                          context, trainings[trainingIndex]);
                                    }),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            )));
  }
}
