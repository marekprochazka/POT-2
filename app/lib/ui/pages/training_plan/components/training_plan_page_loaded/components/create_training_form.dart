import 'package:app/constants.dart';
import 'package:app/models/data/base.dart';
import 'package:app/models/data/training.dart';
import 'package:app/ui/base/base_form/base_form.dart';
import 'package:app/ui/base/base_textfield/base_textfield.dart';
import 'package:app/ui/shared/buttons/pot_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateTrainingForm extends BaseForm {
  final GlobalKey<FormState> formKey;
  const CreateTrainingForm(
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

class CreateTrainingFormBody extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Training instance;
  final double height;
  const CreateTrainingFormBody(
      {Key? key,
      required this.formKey,
      required this.instance,
      required this.height})
      : super(key: key);

  @override
  State<CreateTrainingFormBody> createState() => _CreateTrainingFormBodyState();
}

class _CreateTrainingFormBodyState extends State<CreateTrainingFormBody> {
  int numExercises = 0;
  Widget _buildTrainingNameField() {
    return BaseTextField(
      controller: TextEditingController(text: widget.instance.trainingName),
      validator: (value) {
        if (value?.isEmpty ?? false) {
          return 'Please enter a training name';
        }
        return null;
      },
      width: 250.0,
      height: 30.0,
      onChangedCallback: (String? value) {
        widget.instance.trainingName = value;
      },
    );
  }

  Widget _buildExcerciseFieldset(int index) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: POTColors.white,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: BaseTextField(
                    controller: TextEditingController(
                        text: widget.instance.exercises![index].exerciseName),
                    validator: (value) {
                      if (value?.isEmpty ?? false) {
                        return 'Please enter an exercise name';
                      }
                      return null;
                    },
                    width: 150.0,
                    height: 30.0,
                    onChangedCallback: (String? value) {
                      widget.instance.exercises![index].exerciseName = value;
                    },
                    transparent: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left:8.0, right: 8.0),
              child: Row(children: <Widget>[
                Text('Overload unit', style: POTTextStyles.dynamicText(14, FontWeight.bold, POTColors.white),),
                const Spacer(),
                BaseTextField(
                  controller: TextEditingController(
                      text: widget.instance.exercises![index].overloadUnit),
                  validator: (value) {
                    if (value?.isEmpty ?? false) {
                      return 'Please enter an overload unit';
                    }
                    return null;
                  },
                  width: 150.0,
                  height: 30.0,
                  onChangedCallback: (String? value) {
                    widget.instance.exercises![index].overloadUnit = value;
                  },
                ),
              ]),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left:8.0, right: 8.0),
              child: Row(
                children: <Widget>[
                  Text('Overload type', style: POTTextStyles.dynamicText(14, FontWeight.bold, POTColors.white)),
                  const Spacer(),
                  BaseTextField(
                    controller: TextEditingController(
                        text: widget.instance.exercises![index].overloadType),
                    validator: (value) {
                      if (value?.isEmpty ?? false) {
                        return 'Please enter an overload type';
                      }
                      return null;
                    },
                    width: 150.0,
                    height: 30.0,
                    onChangedCallback: (String? value) {
                      widget.instance.exercises![index].overloadType = value;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 10.0),
          Text('Training name', style: POTTextStyles.dynamicText(20, FontWeight.bold, POTColors.white)),
          const SizedBox(height: 10.0),
          _buildTrainingNameField(),
          const Divider(
            color: POTColors.white,
            thickness: 1.0,
          ),
          const SizedBox(height: 10.0),
          Text('Exercises', style: POTTextStyles.dynamicText(20, FontWeight.bold, POTColors.white)),
          const SizedBox(height: 10.0),
          SizedBox(
            height: widget.height * 0.6,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              itemCount: numExercises,
              itemBuilder: (BuildContext context, int index) {
                return _buildExcerciseFieldset(index);
              },
            ),
          ),
          const Spacer(),
          POTButton(
            text: 'Add exercise',
            textStyle: POTTextStyles.navbarText__active,
            height: 30,
            width: MediaQuery.of(context).size.width * 0.7,
            red: true,
            callback: () async{
              await widget.instance.addNewExercise();
              setState(() {
                numExercises++;
              });
            },
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
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
          ),
        ],
      ),
    );
  }
}
