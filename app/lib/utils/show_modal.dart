
import 'package:flutter/material.dart';


void showModal(BuildContext context, Widget dialog) {
  showGeneralDialog(
    context: context, 
    barrierLabel: '',
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.8),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(scale: Tween<double>(end:1.0, begin:0.0).animate(animation),
        child: child,
      );
    },
    pageBuilder: (context, animation, secondary) => dialog);
    
}