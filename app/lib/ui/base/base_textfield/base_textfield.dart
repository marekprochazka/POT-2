import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class BaseTextField extends StatefulWidget {
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
  State<BaseTextField> createState() => _BaseTextFieldState();
}

class _BaseTextFieldState extends State<BaseTextField> {
  bool _valid = true;

  InputBorder _border() => widget.transparent
              ? const UnderlineInputBorder(
                  borderSide: BorderSide(color: POTColors.tertiary, width: 1.0),
                )
              : OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: POTColors.tertiary, width: 1.0),
                  borderRadius: BorderRadius.circular(15.0));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextFormField(
        textAlign: TextAlign.center,
        minLines: widget.lines,
        maxLines: widget.lines,
        keyboardType: widget.multiline ? TextInputType.multiline : TextInputType.text,
        decoration: InputDecoration(
          errorStyle: const TextStyle(height: 0),
          enabledBorder: _border(),
          focusedBorder: _border(),
          errorBorder: _border(),
          focusedErrorBorder: _border(),
          fillColor: _valid ? Colors.white: POTColors.error,
          filled: widget.transparent && _valid? false: true,
        
        ),
        style:
        widget.transparent ?
            POTTextStyles.dynamicText(16, FontWeight.normal, POTColors.white):
            POTTextStyles.dynamicText(16, FontWeight.normal, POTColors.primary),
        
        validator: (value) {
          if (widget.validator != null) {
            setState(() {
              _valid = false;
            });
            // TODO popup with error message
            return '';
          }
          setState(() {
            _valid = true;
          });
          return null;
        },
        onChanged: (value) {
          widget.controller.text = value;
          widget.onChangedCallback(value);
        },
      ),
    );
  }
}
