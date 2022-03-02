import 'package:app/src/base/basePage/BasePage.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: Column(
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: Text('Hello world'),
            )
        ],
      ),
    );
  }
}