import 'package:app/dev/dummy_api_provider.dart';
import 'package:app/models/data/training.dart';
import 'package:app/ui/base/base_modal/base_modal.dart';
import 'package:app/ui/pages/training_plan/components/training_plan_page_loaded/components/create_training_form.dart';
import 'package:app/utils/loading_popup.dart';
import 'package:app/utils/show_modal.dart';
import 'package:flutter/cupertino.dart';

Future<void> editTrainingForm(BuildContext context, String trainingId) async {
  showLoadingPopup(context, 'Loading training...');
  late final Training training;
  try {
    training = await POTDummyAPI.getTraining(trainingId);
  } catch (e) {
    // TODO error popup
    print(e);
    return;
  }
  print('Training: ${training.trainingName}');
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  hideLoadingPopup(context);
  showModal(
      context,
      BaseFormModal(
        child: CreateTrainingForm(
            formKey: formKey,
            model: training,
            child: CreateTrainingFormBody(
              formKey: formKey,
              instance: training,
              height: MediaQuery.of(context).size.height * 0.9,
            )),
        height: MediaQuery.of(context).size.height * 0.9,
      ));
}
