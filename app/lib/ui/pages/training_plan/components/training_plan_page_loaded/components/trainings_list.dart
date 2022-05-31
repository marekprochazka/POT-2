import 'package:app/models/data/training.dart';
import 'package:app/ui/pages/training_plan/components/training_plan_page_loaded/components/trainings_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrainingsList extends StatefulWidget {
  final List<Training> trainings;

  const TrainingsList({Key? key, required this.trainings}) : super(key: key);

  @override
  State<TrainingsList> createState() => _TrainingsListState();
}

class _TrainingsListState extends State<TrainingsList> {
  late List<TrainingListItem> _trainingListItems;

  @override
  void initState() {
    super.initState();
    _trainingListItems = widget.trainings.map((training) {
      return TrainingListItem(training, false);
    }).toList();
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
      child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.55,
          child: SingleChildScrollView(
            child: Theme(
              data: Theme.of(context).copyWith(cardColor: Colors.transparent),
              child: ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    _trainingListItems[index].isExpanded = !isExpanded;
            
                  });
                },
                children: [
                  for (int i = 0; i < widget.trainings.length; i++)
                    ExpansionPanel(
                      canTapOnHeader: true,
                      isExpanded: _trainingListItems[i].isExpanded,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Container(
                          color: Colors.pink,
                          child: ListTile(
                            title: Text(widget.trainings[i].trainingName!),
                          ),
                        );
                      },
                      body: Container(
                        color: Colors.green,
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: ListView.builder(
                          itemCount: widget.trainings[i].exercises?.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text(widget
                                  .trainings[i].exercises![index].exerciseName!),
                            );
                          },
                        ),
                      ),
                    ),
                ],
              ),
            ),
          )),
    );
  }
}
