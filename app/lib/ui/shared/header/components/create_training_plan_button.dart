import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class CreateTrainingPlanButton extends StatelessWidget {
  const CreateTrainingPlanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: POTColors.tertiary),
          borderRadius: BorderRadius.circular(10),
          color: POTColors.white),
      child: const SizedBox(
        width: 180,
        height: 22,
        child: Center(
            child: Text(
          'Create new Training plan',
          style: POTTextStyles.navbarText__active,
        )),
      ),
    );
  }
}
