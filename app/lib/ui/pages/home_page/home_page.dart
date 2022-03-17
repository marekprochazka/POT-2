import 'package:app/providers/login_state.dart';
import 'package:app/ui/base/basePage/BasePage.dart';
import 'package:app/ui/shared/header/header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      header: true,
      child: FractionallySizedBox(
        child: Padding(
          padding: EdgeInsets.only(top: 60.0),
          child: Text('Hello world'),
        ),
      ),
    );
  }

  void saveLoginState(BuildContext context) {
    Provider.of<LoginState>(context, listen: false).loggedIn = false;
  }
}
