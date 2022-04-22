import 'package:flutter/material.dart';

abstract class BaseForm extends StatefulWidget {
  final Widget child;

  const BaseForm({ Key? key, required this.child }) : super(key: key);

  @override
  State<BaseForm> createState() => _BaseFormState();

  Future<void>  handlePopOut();
}

class _BaseFormState extends State<BaseForm> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [widget.child],
      ),
    );
  }
}


class DummyForm extends BaseForm {
  const DummyForm({ Key? key, required Widget child }) : super(key: key, child: child);

  @override
  Future<void> handlePopOut() async{
    print('DummyForm handlePopOut');
  }
}