import 'package:app/constants.dart';
import 'package:app/ui/base/base_form/base_form.dart';
import 'package:flutter/material.dart';

class BaseFormModal extends StatelessWidget {
  final BaseForm child;
  final double? height;

  const BaseFormModal({Key? key, required this.child, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Padding(
          padding: const EdgeInsets.only(top:20.0),
          child: Dialog(
            elevation: 0,
            clipBehavior: Clip.antiAlias,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SingleChildScrollView(
              child: Stack(children: <Widget>[
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: Container(
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
                          children: <Widget>[child])),
                )
              ]),
            ),
          ),
        ),
        onWillPop: () async {
          await child.handlePopOut();
          return true;
        }); // TODO pop handler here
  }
}
