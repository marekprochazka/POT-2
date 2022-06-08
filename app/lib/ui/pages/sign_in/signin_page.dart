import 'package:app/constants.dart';
import 'package:app/ui/base/base_page/base_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      header: false,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Center(
                child: Text(
                  'Sign in is currently not available. Contact administrator for more information.',
                  style: POTTextStyles.dynamicText(
                      16, FontWeight.bold, POTColors.tertiary),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          TextButton(
              onPressed: () => context.goNamed(RouteNames.loginPage.name),
              child: const Text('back to log in'))
        ],
      ),
    );
  }
}
