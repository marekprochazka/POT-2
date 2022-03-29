import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class POTButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final Function() callback;
  final bool red;
  final TextStyle textStyle;

  const POTButton({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
    required this.callback,
    this.red = false,
    this.textStyle =  POTTextStyles.defaultButtonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callback(),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: red ? POTColors.tertiary : POTColors.white),
          borderRadius: BorderRadius.circular(10),
          color: red ? POTColors.white : Colors.transparent,
        ),
        child: SizedBox(
          width: width,
          height: height,
          child: Center(
            child: Text(
              text,
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }
}