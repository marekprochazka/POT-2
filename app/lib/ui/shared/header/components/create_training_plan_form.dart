import 'package:app/constants.dart';
import 'package:app/models/data/base.dart';
import 'package:app/models/data/training_plan.dart';
import 'package:app/ui/base/base_form/base_form.dart';
import 'package:app/ui/base/base_textfield/base_textfield.dart';
import 'package:app/ui/shared/buttons/pot_button.dart';
import 'package:flutter/material.dart';

class CreateTrainingPlanForm extends BaseForm {
  final GlobalKey<FormState> formKey;
  const CreateTrainingPlanForm(
      {Key? key,
      required Widget child,
      required this.formKey,
      required BaseModel model})
      : super(key: key, child: child, formKeyRoot: formKey, model: model);

  @override
  Future<void> handlePopOut() async {
    print('destroying model of id ${model.id}');
    model.destroy();
  }
}

class CreateTrainingPlanFormBody extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TrainingPlan instance;
  final double height;
  const CreateTrainingPlanFormBody(
      {Key? key,
      required this.formKey,
      required this.instance,
      required this.height})
      : super(key: key);

  @override
  State<CreateTrainingPlanFormBody> createState() =>
      _CreateTrainingPlanFormBodyState();
}

class _CreateTrainingPlanFormBodyState
    extends State<CreateTrainingPlanFormBody> {
  final TextEditingController _planName = TextEditingController();
  final TextEditingController _description = TextEditingController();

  Widget _buildPlanNameField() {
    return BaseTextField(
      controller: _planName,
      validator: (value) {
        if (value?.isEmpty ?? false) {
          return 'Please enter a plan name';
        }
        return null;
      },
      width: 250.0,
      height: 30.0,
      onChangedCallback: (String? value) {
        widget.instance.planName = value;
      },
    );
  }

  Widget _buildPlanDescriptionField() {
    return BaseTextField(
        controller: _description,
        width: 250.0,
        height: 100.0,
        lines: 20,
        multiline: true,
        onChangedCallback: (String? value) {
          widget.instance.description = value;
        });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 10.0),
          Text('Plan name',
              style: POTTextStyles.dynamicText(
                  20, FontWeight.bold, POTColors.white)),
          const SizedBox(height: 10.0),
          _buildPlanNameField(),
          const SizedBox(height: 20.0),
          Text('Plan description',
              style: POTTextStyles.dynamicText(
                  20, FontWeight.bold, POTColors.white)),
          const SizedBox(height: 10.0),
          _buildPlanDescriptionField(),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: <Widget>[
                POTButton(
                    width: 100.0,
                    height: 30,
                    text: 'Cancel',
                    callback: () {
                      print('cancelling instance of id ${widget.instance.id}');
                      widget.instance.destroy();
                      Navigator.pop(context);
                    }),
                const Spacer(),
                POTButton(
                    width: 100.0,
                    height: 30,
                    text: 'Save',
                    callback: () {
                      print('saving instance of id ${widget.instance.id}');
                      widget.instance.save();
                      Navigator.pop(context);
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}