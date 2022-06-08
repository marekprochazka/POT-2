import 'package:app/constants.dart';
import 'package:app/init.dart';
import 'package:app/models/environment.dart';
import 'package:app/models/data/user.dart';
import 'package:app/providers/api_provider.dart';
import 'package:app/providers/is_frozen_state.dart';
import 'package:app/providers/plan_list_state.dart';
import 'package:app/router.dart';
import 'package:app/providers/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

Future<void> main() async {
  potInit();
}

class POTEntry extends StatelessWidget {
  final LoginState loginState;
  final User user;

  const POTEntry({Key? key, required this.loginState, required this.user})
      : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginState>(
            lazy: false, create: (BuildContext createContext) => loginState),
        ChangeNotifierProvider<IsFrozenState>(
            lazy: false,
            create: (BuildContext createContext) => IsFrozenState()),
        Provider<POTRouter>(
          lazy: false,
          create: (BuildContext createContext) => POTRouter(loginState),
        ),
        Provider<User>(
            lazy: false, create: (BuildContext createContext) => user),
        Provider<POTApiProvider>(
          lazy: false,
          create: (BuildContext createContext) => POTApiProvider(user.token),
        ),
        ChangeNotifierProvider<PlanListState>(
          lazy: false,
          create: (BuildContext createContext) => PlanListState(),
        ),
      ],
      child: Builder(builder: (BuildContext context) {
        final router = Provider.of<POTRouter>(context, listen: false).router;
        return MaterialApp.router(
          builder: EasyLoading.init(),
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          debugShowCheckedModeBanner: false,
          title: 'POT',
          theme: ThemeData(
              appBarTheme:
                  const AppBarTheme(backgroundColor: POTColors.primary),
              primarySwatch: Colors.blue),
        );
      }),
    );
  }
}
