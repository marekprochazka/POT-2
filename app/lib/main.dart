import 'package:app/models/environment.dart';
import 'package:app/router.dart';
import 'package:app/states/loginState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  await dotenv.load(fileName: Environ.fileName);
  final loginState = LoginState(await SharedPreferences.getInstance());
  loginState.checkLoggedIn();
  runApp(MyApp(loginState: loginState));
}

class MyApp extends StatelessWidget {
  final LoginState loginState;
  const MyApp({Key? key, required this.loginState}) : super(key: key);

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
        )
      ],
      child: Builder(builder: (BuildContext context) {
        final router = Provider.of<POTRouter>(context, listen: false).router;
        return MaterialApp.router(
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          debugShowCheckedModeBanner: false,
          title: 'POT',
          theme: ThemeData(primarySwatch: Colors.blue),
        );
      }),
    );
  }
}
