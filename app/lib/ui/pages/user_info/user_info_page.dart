import 'package:app/constants.dart';
import 'package:app/models/data/user.dart';
import 'package:app/providers/login_state.dart';
import 'package:app/ui/base/base_page/base_page.dart';
import 'package:app/ui/shared/buttons/pot_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      header: true,
      child: FractionallySizedBox(
        child: Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Column(
            children: [
              const Text('User info test'),
              const SizedBox(height: 10),
              POTButton(
                  width: 100,
                  height: 30,
                  text: 'logout',
                  red: true,
                  textStyle: POTTextStyles.navbarText__active,
                  callback: () async {
                    await Provider.of<User>(context, listen: false).logout(context);
                    Provider.of<LoginState>(context, listen: false).checkLoggedIn();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
