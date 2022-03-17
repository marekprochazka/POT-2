import 'package:app/constants.dart';
import 'package:app/providers/login_state.dart';
import 'package:app/ui/base/basePage/BasePage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: Text('Login page'),
          ),
          TextButton(onPressed: () => context.goNamed(RouteNames.signInPage) , child: const Text('Not registred yet')),
          TextButton(onPressed: () => saveLoginState(context) , child: const Text('Log in')),
        ],
      ),
    );
  }
  void saveLoginState(BuildContext context) {
    Provider.of<LoginState>(context, listen: false).loggedIn = true;
  }
}
