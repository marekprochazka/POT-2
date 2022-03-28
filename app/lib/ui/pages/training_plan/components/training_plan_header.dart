import 'package:app/constants.dart';
import 'package:app/models/data/training_plan.dart';
import 'package:app/utils/get_url_string.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
          image: CachedNetworkImageProvider(getUrlString(trainingPlan.planImage)),
          fit: BoxFit.cover,
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Center(
                child: Text(
              trainingPlan.planName,
              style: POTTextStyles.navbarTitle,
            )),
          )
        ],
        ),
    );
  }
}