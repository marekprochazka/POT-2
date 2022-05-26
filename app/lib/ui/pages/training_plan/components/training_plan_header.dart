import 'package:app/constants.dart';
import 'package:app/models/data/training_plan.dart';
import 'package:app/ui/shared/buttons/pot_button.dart';
import 'package:app/utils/get_url_string.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TrainingPlanHeader extends StatelessWidget {
  final TrainingPlan trainingPlan;

  const TrainingPlanHeader({Key? key, required this.trainingPlan}) : super(key: key);

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
          image: CachedNetworkImageProvider(getUrlString(trainingPlan.planImage ?? '')),
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
              trainingPlan.planName ?? '',
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
                child: POTButton(width: 150, height: 26, text: 'Create training', textStyle: POTTextStyles.dynamicText(13, FontWeight.bold, POTColors.tertiary), callback: () {}, red: true,),
              ),
            ],
            )
        ],
        ),
    );
  }
}