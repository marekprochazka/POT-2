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
  final String? placeholder;
  final bool enabled;

  const BaseTextField(
      {Key? key,
      required this.controller,
      this.validator,
      this.lines = 1,
      required this.width,
      required this.height,
      this.multiline = false,
      required this.onChangedCallback,
      this.transparent = false,
      this.placeholder,
      this.enabled=true})
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
        enabled: widget.enabled,
        controller: widget.controller,
        textAlign: TextAlign.center,
        minLines: widget.lines,
        maxLines: widget.lines,
        keyboardType: widget.multiline ? TextInputType.multiline : TextInputType.text,
        decoration: InputDecoration(
          hintText: widget.placeholder,
          hintStyle: POTTextStyles.dynamicText(16, FontWeight.normal, POTColors.tertiary),
          isDense: true,
          contentPadding: const EdgeInsets.all(5.0),
          errorStyle: const TextStyle(height: 0),
          enabledBorder: _border(),
          focusedBorder: _border(),
          errorBorder: _border(),
          disabledBorder: _border(),
          focusedErrorBorder: _border(),
          fillColor: _valid ? Colors.white: POTColors.error,
          filled: widget.transparent && _valid? false: true,
        
        ),
        style:
        widget.transparent ?
            POTTextStyles.dynamicText(16, FontWeight.normal, POTColors.white):
            POTTextStyles.dynamicText(16, FontWeight.normal, POTColors.primary),
        
        validator: (value) {
          String? err;
          if (widget.validator != null) {
            err = widget.validator!(value);
            setState(() {
              _valid = err == null;
            });
            // TODO popup with error message
            return err == null ? err: '';
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

  void refresh() => setState(() {});
}
