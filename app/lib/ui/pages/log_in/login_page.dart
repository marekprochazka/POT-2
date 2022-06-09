import 'package:app/constants.dart';
import 'package:app/models/data/user.dart';
import 'package:app/ui/base/base_page/base_page.dart';
import 'package:app/ui/pages/log_in/login_form.dart';
import 'package:app/utils/exceptions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      header: false,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: Text('Login page'),
          ),
          TextButton(
              onPressed: () => context.goNamed(RouteNames.signInPage.name),
              child: const Text('Not registred yet')),
          LoginForm(onSubmit: logIn),
        ],
      ),
    );
  }

  Future<Map?> logIn(BuildContext context, String email, String password) async {
    try {
      await User.login(context, email, password);
    }
    on BadRequestException catch (e) {
      return(e.message);
    }
    return null;
  }
}
