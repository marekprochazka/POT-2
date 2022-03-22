import 'package:app/dev/dummy_api_provider.dart';
import 'package:app/models/data/training_plan.dart';
import 'package:flutter/material.dart';

class TrainingPlansList extends StatefulWidget {
  const TrainingPlansList({Key? key}) : super(key: key);

  @override
  State<TrainingPlansList> createState() => _TrainingPlansListState();
}

class _TrainingPlansListState extends State<TrainingPlansList> {
  late Future<List<TrainingPlan>> futureTrainingPlans;

  @override
  void initState() {
    super.initState();
    futureTrainingPlans = _getTrainingPlan();
  }

  Future<List<TrainingPlan>> _getTrainingPlan() async {
    return await POTDummyAPI.getPlans();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: futureTrainingPlans,
        builder: (context, AsyncSnapshot<List<TrainingPlan>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('No data');
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Text('Loading');
            case ConnectionState.done:
              // return Text('done');
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Text(snapshot.data![index].planName);
                  },
                );
              }
              return Text('No data');
          }
        },
      ),
    );
  }
}
