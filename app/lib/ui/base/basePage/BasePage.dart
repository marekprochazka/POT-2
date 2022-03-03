

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {

  final Widget child;

  const BasePage({ required this.child, Key? key }) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white
        ),
        child: SafeArea(child: child),
      )
    );
  }
}