import 'package:app/constants.dart';
import 'package:app/models/environment.dart';
import 'package:app/models/user.dart';
import 'package:app/router.dart';
import 'package:app/providers/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  await dotenv.load(fileName: Environ.fileName);
  final prefs = await SharedPreferences.getInstance();
  final loginState = LoginState(prefs);
  final user = User('Gigachad', 'giga@chad.com', '/media/training_plan/2022/03/11/7978a8fa-95b4-42bd-a2cd-e156ed51d85d.png');
  loginState.checkLoggedIn();
  runApp(MyApp(loginState: loginState, user: user,));
}

class MyApp extends StatelessWidget {
  final LoginState loginState;
  final User user;

  const MyApp({Key? key, required this.loginState, required this.user}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginState>(
            lazy: false, 
            create: (BuildContext createContext) => loginState),
        Provider<POTRouter>(
          lazy: false,
          create: (BuildContext createContext) => POTRouter(loginState),
        ),
        Provider<User>(
          lazy: false,
          create: (BuildContext createContext) => user)
      ],
      child: Builder(builder: (BuildContext context) {
        final router = Provider.of<POTRouter>(context, listen: false).router;
        return MaterialApp.router(
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          debugShowCheckedModeBanner: false,
          title: 'POT',
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: POTColors.primary
            ),
            primarySwatch: Colors.blue),
        );
      }),
    );
  }
}
