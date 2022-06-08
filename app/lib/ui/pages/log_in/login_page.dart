import 'package:app/constants.dart';
import 'package:app/models/data/user.dart';
import 'package:app/providers/api_provider.dart';
import 'package:app/providers/login_state.dart';
import 'package:app/ui/base/base_page/base_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(Provider.of<POTApiProvider>(context, listen: false).userToken);
    print(Provider.of<User>(context, listen: false).username);
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
          TextButton(
              onPressed: () => logIn(context), child: const Text('Log in')),
        ],
      ),
    );
  }

  void logIn(BuildContext context) async {
    User user =
        await User.login(context, 'm.prochazka2002@gmail.com', 'mojeHeslo2002');
  }
}
