import 'package:app/constants.dart';
import 'package:app/ui/base/base_page/base_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: Column(
        children:  [
          const Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: Text('Sign in page'),
          ),
          TextButton(onPressed: () => context.goNamed(RouteNames.loginPage) , child: const Text('log in'))
          
        ],
      ),
    );
  }
}
