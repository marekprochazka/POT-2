import 'package:app/constants.dart';
import 'package:app/models/data/training_plan.dart';
import 'package:app/utils/get_url_string.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class PlanListItem extends StatelessWidget {
  final TrainingPlan trainingPlan;
  const PlanListItem({Key? key, required this.trainingPlan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.goNamed(RouteNames.trainingPlanPage.name, params: {'id':trainingPlan.id}),
      child: FractionallySizedBox(
        widthFactor: 0.7,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                  getUrlString(trainingPlan.planImage)),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
            Text(
              trainingPlan.planName,
              style: POTTextStyles.dynamicText(
                  36, FontWeight.bold, POTColors.white),
            ),
            Flexible(
              child: Text(
                trainingPlan.description,
                style: POTTextStyles.dynamicText(
                    14, FontWeight.bold, POTColors.white,),
                overflow: TextOverflow.fade,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
