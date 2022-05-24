

import 'package:app/constants.dart';
import 'package:app/ui/shared/header/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class BasePage extends StatelessWidget {

  final Widget child;
  final bool header;
  final Widget? customHeader;

  const BasePage({ required this.child, this.header=true, this.customHeader, Key? key }) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarColor: POTColors.primary),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: POTColors.white,
          ),
          child: SafeArea(child: header? 
            Column(children: [
              Expanded(flex:3,child: customHeader != null ? customHeader!:const Header()),
              Expanded(flex:8,child: child),
            ],)
          :child),
        )
      ),
    );
  }
}