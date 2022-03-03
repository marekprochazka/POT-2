import 'package:app/providers/loginState.dart';
import 'package:app/ui/base/basePage/BasePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: Text('Hello world'),
          ),
          TextButton(
              onPressed: () => saveLoginState(context),
              child: const Text('Log out')),
        ],
      ),
    );
  }

  void saveLoginState(BuildContext context) {
    Provider.of<LoginState>(context, listen: false).loggedIn = false;
  }
}
