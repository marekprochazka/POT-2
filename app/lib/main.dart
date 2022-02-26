import 'package:app/models/environment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: Environ.fileName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'POT project',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Column(
          children: [const Text('hello'), Text(Environ.apiUrl)],
        ));
  }
}
