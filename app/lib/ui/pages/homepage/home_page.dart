import 'package:app/constants.dart';
import 'package:app/providers/login_state.dart';
import 'package:app/ui/base/base_page/base_page.dart';
import 'package:app/ui/pages/homepage/components/training_plans_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BasePage(
      header: true,
      child: FractionallySizedBox(
        child: Padding(
          padding: const EdgeInsets.only(top: 14.0),
          child: Column(
            children: const [
              Text('Training plans', style: POTTextStyles.pageTitle,),
              TrainingPlansList()
            ],
          ),
        ),
      ),
    );
  }

  void saveLoginState(BuildContext context) {
    Provider.of<LoginState>(context, listen: false).loggedIn = false;
  }
}
