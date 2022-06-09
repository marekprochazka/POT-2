import 'package:app/constants.dart';
import 'package:app/models/data/base.dart';
import 'package:app/models/data/overload.dart';
import 'package:app/models/data/training_active.dart';
import 'package:app/providers/training_list_state.dart';
import 'package:app/ui/base/base_form/base_form.dart';
import 'package:app/ui/base/base_modal/base_modal.dart';
import 'package:app/ui/base/base_textfield/base_textfield.dart';
import 'package:app/ui/shared/buttons/pot_button.dart';
import 'package:app/utils/loading_popup.dart';
import 'package:app/utils/show_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WriteOverloadForm extends BaseForm {
  final GlobalKey<FormState> formKey;
  final BuildContext context;
  const WriteOverloadForm(
      {Key? key,
      required Widget child,
      required this.formKey,
      required BaseModel model,
      required this.context})
      : super(key: key, child: child, formKeyRoot: formKey, model: model);

  @override
  Future<void> handlePopOut() async {
    print('destroying model of id ${model.id}');
    model.save(context);
  }
}

class WriteOverloadFormBody extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TrainingActive instance;
  final double height;
  const WriteOverloadFormBody(
      {Key? key,
      required this.formKey,
      required this.instance,
      required this.height})
      : super(key: key);

  @override
  State<WriteOverloadFormBody> createState() => _WriteOverloadFormBodyState();
}

class _WriteOverloadFormBodyState extends State<WriteOverloadFormBody> {

  Overload _gO(int index) {
    return widget.instance.overloads[index];
  }

  Widget _buildFormRow(int index) {
    return Row(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(_gO(index).exerciseName,
              style: POTTextStyles.dynamicText(
                  14, FontWeight.bold, POTColors.white)),
        )),
        const SizedBox(width: 10.0),
        if (_gO(index).defaultAddOverloadValue != null)
          POTButton(
              width: 30,
              height: 30,
              text: '+${_gO(index).defaultAddOverloadValue.toString()}',
              callback: () {
                _gO(index).value = (_gO(index).value != null
                        ? double.parse(_gO(index).value!) +
                            _gO(index).defaultAddOverloadValue!
                        : _gO(index).defaultAddOverloadValue)
                    .toString();
                setState(() {});
              }),
        if (_gO(index).defaultAddOverloadValue == null)
          const SizedBox(width: 15.0),
        const SizedBox(width: 10.0),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: BaseTextField(
            controller: TextEditingController(text: _gO(index).value),
            width: 50.0,
            height: 30.0,
            onChangedCallback: (String? value) => _gO(index).value = value,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return null;
              }
              return double.tryParse(value) == null ? 'Overload value must be a number':null;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Text(_gO(index).overloadUnit ?? '',
              style: POTTextStyles.dynamicText(
                  14, FontWeight.bold, POTColors.white)),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Column(
        children: [
          const SizedBox(height: 10.0),
          Text(widget.instance.trainingName,
              style: POTTextStyles.dynamicText(
                  20, FontWeight.bold, POTColors.white)),
          const SizedBox(height: 10.0),
          const Divider(
            color: POTColors.white,
            thickness: 1.0,
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            height: widget.height * 0.6,
            child: ListView.builder(
              itemCount: widget.instance.overloads.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildFormRow(index);
              },
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                POTButton(
                  width: 100,
                  height: 30,
                  text: 'Cancel',
                  callback: () => Navigator.pop(context),
                ),
                const Spacer()
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                POTButton(
                  width: 100,
                  height: 30,
                  text: 'Save and continue',
                  callback: () async {
                    if (widget.formKey.currentState!.validate()) {
                      await widget.instance.writeOverload(context);
                      Provider.of<TrainingListState>(context, listen: false).notify();
                      Navigator.pop(context);
                    }
                  },
                ),
                const Spacer(),
                POTButton(
                  width: 100,
                  height: 30,
                  text: 'Finish training',
                  callback: () async {
                    if (widget.formKey.currentState!.validate()) {
                      await widget.instance.finish(context);
                      Provider.of<TrainingListState>(context, listen: false).notify();
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Future<void> showWriteOverloadForm(
    BuildContext context, String trainingId) async {
  showLoadingPopup(context, 'Loading...');
  final TrainingActive? trainingActive = await TrainingActive.getLast(context, trainingId);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  print('DEBUG $trainingActive');
  hideLoadingPopup(context);
  if (trainingActive == null) {
    return;
  }
  showModal(
      context,
      BaseFormModal(
        child: WriteOverloadForm(
          formKey: formKey,
          model: trainingActive,
          context: context,
          child: WriteOverloadFormBody(
            formKey: formKey,
            instance: trainingActive,
            height: MediaQuery.of(context).size.height * 0.9,
          ),
        ),
        height: MediaQuery.of(context).size.height * 0.9,
      ));
}
