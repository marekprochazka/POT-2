import 'package:app/providers/is_frozen_state.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

void showLoadingPopup(context, status) {
  Provider.of<IsFrozenState>(context, listen: false).isFrozen = true;
  EasyLoading.show(status: status);
}

void hideLoadingPopup(context) {
  Provider.of<IsFrozenState>(context, listen: false).isFrozen = false;
  EasyLoading.dismiss();
}