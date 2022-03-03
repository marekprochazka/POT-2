import 'package:app/providers/loginState.dart';
import 'package:app/ui/base/basePage/BasePage.dart';
import 'package:app/ui/shared/header/Header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: Column(
        children: const [
          Expanded(
            flex: 2,
            child: Header()
            ),
          Expanded(
            flex: 8,
            child: FractionallySizedBox(
              child: Padding(
                padding: EdgeInsets.only(top: 60.0),
                child: Text('Hello world'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void saveLoginState(BuildContext context) {
    Provider.of<LoginState>(context, listen: false).loggedIn = false;
  }
}
