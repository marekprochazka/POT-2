import 'package:app/models/data/base.dart';
import 'package:flutter/material.dart';

abstract class BaseForm extends StatefulWidget {
  final Widget child;
  final GlobalKey<FormState> formKeyRoot;
  final BaseModel model;

  const BaseForm(
      {Key? key,
      required this.child,
      required this.formKeyRoot,
      required this.model})
      : super(key: key);

  @override
  State<BaseForm> createState() => _BaseFormState();

  Future<void> handlePopOut();
}

class _BaseFormState extends State<BaseForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKeyRoot,
      child: Column(
        children: [widget.child],
      ),
    );
  }
}
