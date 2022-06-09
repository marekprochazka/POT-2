import 'dart:async';

import 'package:app/constants.dart';
import 'package:app/models/data/exercise.dart';
import 'package:app/models/data/training.dart';
import 'package:app/providers/api_provider.dart';
import 'package:app/providers/training_list_state.dart';
import 'package:app/ui/pages/training_plan/components/training_plan_page_loaded/components/edit_training_form.dart';
import 'package:app/ui/pages/training_plan/components/training_plan_page_loaded/components/trainings_list_body.dart';
import 'package:app/ui/pages/training_plan/components/training_plan_page_loaded/components/write_overload_form.dart';
import 'package:app/ui/shared/buttons/pot_button.dart';
import 'package:app/ui/shared/expansion_panel/pot_expansion_panel.dart';
import 'package:app/utils/handle_api_call.dart';
import 'package:app/utils/loading_popup.dart';
import 'package:app/utils/show_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';


class TrainingsList extends StatefulWidget {
  final List<Training> trainings;
  final String planId;

  const TrainingsList({Key? key, required this.trainings, required this.planId}) : super(key: key);

  @override
  State<TrainingsList> createState() => _TrainingsListState();
}

class _TrainingsListState extends State<TrainingsList> {
  late Future<List<Training>> trainings;

  @override
  void initState() {
    super.initState();
    Completer<List<Training>> artificialFuture = Completer<List<Training>>();
    artificialFuture.complete(widget.trainings);
    trainings = artificialFuture.future;
  }



  Future<List<Training>> _reloadTrainings() async {
    List<Training>? result = await handleApiCall(context, 
    () => Provider.of<POTApiProvider>(context, listen: false).getTrainings(widget.planId));
    return result ?? [];
  }

  void addListener() {
    Provider.of<TrainingListState>(context, listen: false).addListener(() {
      setState(() {
        trainings = _reloadTrainings();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    addListener();
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 30.0, right: 30.0),
      child: FutureBuilder(
        future: trainings,
        builder: (context, AsyncSnapshot<List<Training>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text('No data');
            case ConnectionState.active:
            case ConnectionState.waiting:
              showLoadingPopup(context, 'Loading trainings...', freeze: false);
              return const SizedBox();
            case ConnectionState.done:
              if (snapshot.hasData) {
                hideLoadingPopup(context, freeze: false);
                return TrainingsListBody(trainings: snapshot.data!);
              }
              return const Text('No data');
          }
        },
      ),
    );
  }
}
