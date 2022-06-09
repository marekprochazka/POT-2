import 'package:app/providers/is_frozen_state.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

void showLoadingPopup(context, status, {freeze = true}) {
  if(freeze) {
    Provider.of<IsFrozenState>(context, listen: false).isFrozen = true;
  }
  
  EasyLoading.show(status: status);
}

void hideLoadingPopup(context, {freeze = true}) {
  if (freeze) {
    Provider.of<IsFrozenState>(context, listen: false).isFrozen = false;
  }
  EasyLoading.dismiss();
}