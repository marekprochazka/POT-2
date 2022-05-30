import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class BaseTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final double width;
  final double height;
  final int lines;
  final bool multiline;
  final void Function(String?) onChangedCallback;
  final bool transparent;

  const BaseTextField(
      {Key? key,
      required this.controller,
      this.validator,
      this.lines = 1,
      required this.width,
      required this.height,
      this.multiline = false,
      required this.onChangedCallback,
      this.transparent = false})
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
          enabledBorder: transparent
              ? const UnderlineInputBorder(
                  borderSide: BorderSide(color: POTColors.tertiary, width: 1.0),
                )
              : OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: POTColors.tertiary, width: 1.0),
                  borderRadius: BorderRadius.circular(15.0)),
          focusedBorder: transparent
              ? const UnderlineInputBorder(
                  borderSide: BorderSide(color: POTColors.tertiary, width: 1.0),
                )
              : OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: POTColors.tertiary, width: 1.0),
                  borderRadius: BorderRadius.circular(15.0)),
          fillColor: transparent ? Colors.transparent: POTColors.white,
          filled: true,
        ),
        style:
        transparent ?
            POTTextStyles.dynamicText(16, FontWeight.normal, POTColors.white):
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
