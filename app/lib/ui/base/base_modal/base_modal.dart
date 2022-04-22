import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class BaseModal extends StatelessWidget {
  final Widget child;
  final double? height;

  const BaseModal({Key? key, required this.child, required this.height})
      : super(key: key);

  // TODO close button switch (closs button on click callback should be Navigator.pop(context))

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Dialog(
          elevation: 0,
          clipBehavior: Clip.antiAlias,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: POTGradients.defaultGradient,
                ),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[child]))
          ]),
        ),
        onWillPop: () => Future.value(true)); // TODO pop handler here
  }
}
