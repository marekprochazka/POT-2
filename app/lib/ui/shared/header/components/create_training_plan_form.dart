import 'package:app/ui/base/base_form/base_form.dart';
import 'package:app/ui/base/base_textfield/base_textfield.dart';
import 'package:flutter/material.dart';

class CreateTrainingPlanForm extends BaseForm {
  final GlobalKey<FormState> formKey;
  const CreateTrainingPlanForm({Key? key, required Widget child, required this.formKey})
      : super(key: key, child: child, formKeyRoot: formKey);

  @override
  Future<void> handlePopOut() async {
    print('CreateTrainingPlanForm handlePopOut');
  }
}

class CreateTrainingPlanFormBody extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const CreateTrainingPlanFormBody({ Key? key, required this.formKey }) : super(key: key);

  @override
  State<CreateTrainingPlanFormBody> createState() => _CreateTrainingPlanFormBodyState();
}

class _CreateTrainingPlanFormBodyState extends State<CreateTrainingPlanFormBody> {
  
  final TextEditingController _planName = TextEditingController();
  final TextEditingController _planDescription = TextEditingController();

  Widget _buildPlanNameField() {
    return BaseTextField(controller: _planName, validator: (value) {
      if (value?.isEmpty ?? false) {
        return 'Please enter a plan name';
      }
      return null;
    }, width: 250.0, height:30.0);
  }

  Widget _buildPlanDescriptionField() {
    return BaseTextField(controller: _planDescription, validator: (value) {
      if (value?.isEmpty ?? false) {
        return 'Please enter a plan description';
      }
      return null;
    }, width: 250.0,height:100.0, lines: 20, multiline: true);
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildPlanNameField(),
        _buildPlanDescriptionField(),
        ElevatedButton(
          child: const Text('Create'),
          onPressed: () async {
            if (widget.formKey.currentState?.validate() ?? false) {
              print('CreateTrainingPlanFormBody _buildPlanNameField ${_planName.text}');
            }
          },
        ),
      ],
    );
  }
}