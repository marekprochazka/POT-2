import 'package:app/constants.dart';
import 'package:app/models/data/training.dart';
import 'package:app/models/data/training_plan.dart';
import 'package:app/ui/base/base_modal/base_modal.dart';
import 'package:app/ui/pages/training_plan/components/training_plan_page_loaded/components/create_training_form.dart';
import 'package:app/ui/shared/buttons/pot_button.dart';
import 'package:app/utils/get_url_string.dart';
import 'package:app/utils/loading_popup.dart';
import 'package:app/utils/show_modal.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TrainingPlanHeader extends StatefulWidget {
  final TrainingPlan trainingPlan;

  const TrainingPlanHeader({Key? key, required this.trainingPlan}) : super(key: key);

  @override
  State<TrainingPlanHeader> createState() => _TrainingPlanHeaderState();
}

class _TrainingPlanHeaderState extends State<TrainingPlanHeader> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late Training? _newTraining;

  Future<String?> fetchNewTraining() async {
    showLoadingPopup(context, 'Creating new training...');
    try {
      _newTraining = await Training.getNew();
    } catch(err) {
      hideLoadingPopup(context);
      return err.toString();
    }
    hideLoadingPopup(context);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        boxShadow: const <BoxShadow>[
          BoxShadow(
              color: POTColors.primary50, blurRadius: 5, offset: Offset(0, 9))
        ],
        image: DecorationImage(
          image: CachedNetworkImageProvider(getUrlString(widget.trainingPlan.planImage ?? '')),
          fit: BoxFit.cover,
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Center(
                child: Text(
              widget.trainingPlan.planName ?? '',
              style: POTTextStyles.navbarTitle,
            )),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right:8.0),
                child: POTButton(width: 150, height: 26, text: 'Plan settings', textStyle: POTTextStyles.dynamicText(13, FontWeight.bold, POTColors.white), callback: () {},),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: POTButton(width: 150, height: 26, text: 'Back to homepage', textStyle: POTTextStyles.dynamicText(13, FontWeight.bold, POTColors.white), callback: () => context.goNamed(RouteNames.homePage.name),),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: POTButton(width: 150, height: 26, text: 'Create training', textStyle: POTTextStyles.dynamicText(13, FontWeight.bold, POTColors.tertiary), callback: () async {
                  final String? err = await fetchNewTraining();
                  if (err != null) {
                    // TODO handle error
                  } else {
                    showModal(context, BaseFormModal(
                      child: CreateTrainingForm(
                        formKey: _formKey,
                        model: _newTraining!,
                        child: CreateTrainingFormBody(
                          formKey: _formKey,
                          instance: _newTraining!,
                          height: MediaQuery.of(context).size.height * 0.7,
                        )
                      ), 
                      height: MediaQuery.of(context).size.height * 0.7,));
                  }
                }, red: true,),
              ),
            ],
            )
        ],
        ),
    );
  }
}