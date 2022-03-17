

import 'package:app/constants.dart';
import 'package:app/ui/shared/header/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';


class BasePage extends StatelessWidget {

  final Widget child;
  final bool header;

  const BasePage({ required this.child, this.header=true, Key? key }) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarColor: POTColors.primary),
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: POTColors.white,
          ),
          child: SafeArea(child: header? 
            Column(children: [
              const Expanded(flex:2,child: Header()),
              Expanded(flex:8,child: child),
            ],)
          :child),
        )
      ),
    );
  }
}