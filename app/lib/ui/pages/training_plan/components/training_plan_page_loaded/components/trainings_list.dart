import 'package:app/constants.dart';
import 'package:app/models/data/exercise.dart';
import 'package:app/models/data/training.dart';
import 'package:app/ui/shared/expansion_panel/pot_expansion_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrainingsList extends StatefulWidget {
  final List<Training> trainings;

  const TrainingsList({Key? key, required this.trainings}) : super(key: key);

  @override
  State<TrainingsList> createState() => _TrainingsListState();
}

class _TrainingsListState extends State<TrainingsList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 30.0, right: 30.0),
      child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.55,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            physics: const ScrollPhysics(),
            itemCount: widget.trainings.length,
            itemBuilder: (context, trainingIndex) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: POTExpansionPanel(
                  headerHeight: 50.0,
                  bodyHeight:
                      ((widget.trainings[trainingIndex].exercises?.length ??
                                  0) *
                              20.0) +
                          30.0,
                  headerChild: Text(
                    widget.trainings[trainingIndex].trainingName!,
                    style: POTTextStyles.dynamicText(
                        18, FontWeight.bold, POTColors.white),
                  ),
                  bodyChild: const Text('TODO'),
                ),
              );
            },
          )),
    );
  }
}
