import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class BaseTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final double width;
  final double height;
  final int lines;
  final bool multiline;
  final String? Function(String?) onChangedCallback;

  const BaseTextField(
      {Key? key,
      required this.controller,
      this.validator,
      this.lines = 1,
      required this.width,
      required this.height,
      this.multiline = false,
      required this.onChangedCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        textAlign: TextAlign.center,
        minLines: lines,
        maxLines: lines,
        keyboardType: multiline ? TextInputType.multiline : TextInputType.text,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: POTColors.tertiary, width: 1.0),
              borderRadius: BorderRadius.circular(15.0)),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: POTColors.tertiary, width: 1.0),
              borderRadius: BorderRadius.circular(15.0)),
          fillColor: POTColors.white,
          filled: true,
        ),
        style:
            POTTextStyles.dynamicText(16, FontWeight.normal, POTColors.primary),
        validator: (value) {
          if (validator != null) {
            return validator!(value);
          }
          return null;
        },
        onChanged: (value) {
          controller.text = value;
          onChangedCallback(value);
        },
      ),
    );
  }
}
