import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class POTButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final Function() callback;
  final bool red;
  final TextStyle textStyle;
  final IconData? icon;

  const POTButton({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
    required this.callback,
    this.red = false,
    this.textStyle =  POTTextStyles.defaultButtonText,
    this.icon,
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
          child: Row(
            children: [
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(left: 3.0),
                  child: Icon(
                    icon,
                    color: red ? POTColors.tertiary : POTColors.white,
                  ),
                ),
              Expanded(
                child: Center(
                  child: Text(
                    text,
                    style: textStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}