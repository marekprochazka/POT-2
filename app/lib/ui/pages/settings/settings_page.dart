import 'package:app/ui/base/base_page/base_page.dart';
import 'package:flutter/cupertino.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      header: true,
      child: FractionallySizedBox(
        child: Padding(
          padding: EdgeInsets.only(top: 60.0),
          child: Text('Settings'),
        ),
      ),
    );
  }
}
