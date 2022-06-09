import 'package:app/ui/base/base_page/base_page.dart';
import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      header: true,
      child: FractionallySizedBox(
        child: Padding(
          padding: EdgeInsets.only(top: 60.0),
          child: Text('Messages'),
        ),
      ),
    );
  }
}
