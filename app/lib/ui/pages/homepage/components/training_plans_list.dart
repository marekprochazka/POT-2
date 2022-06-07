import 'package:app/dev/dummy_api_provider.dart';
import 'package:app/models/data/training_plan.dart';
import 'package:app/providers/api_provider.dart';
import 'package:app/ui/pages/homepage/components/plan_list_item.dart';
import 'package:app/utils/loading_popup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  }

  Future<List<TrainingPlan>> _getTrainingPlan(context) async {
    return await Provider.of<POTApiProvider>(context, listen: false).getPlans();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getTrainingPlan(context),
      builder: (context, AsyncSnapshot<List<TrainingPlan>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Text('No data');
          case ConnectionState.active:
          case ConnectionState.waiting:
            showLoadingPopup(context, 'Loading training plans...', freeze: false);
            return const SizedBox();
          case ConnectionState.done:
            // return Text('done');
            if (snapshot.hasData) {
              hideLoadingPopup(context, freeze: false);
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.55,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const ScrollPhysics(),
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top:25.0),
                      child: PlanListItem(trainingPlan: snapshot.data![index]),
                    );
                  },
                ),
              );
            }
            return const Text('No data');
        }
      },
    );
  }
}
