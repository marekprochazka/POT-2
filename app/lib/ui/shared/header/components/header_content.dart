import 'package:app/constants.dart';
import 'package:app/models/data/training_plan.dart';
import 'package:app/models/header_icons.dart';
import 'package:app/providers/is_frozen_state.dart';
import 'package:app/ui/base/base_form/base_form.dart';
import 'package:app/ui/base/base_modal/base_modal.dart';
import 'package:app/ui/shared/buttons/pot_button.dart';
import 'package:app/ui/shared/header/components/create_training_plan_form.dart';
import 'package:app/ui/shared/header/components/navbar_text.dart';
import 'package:app/utils/loading_popup.dart';
import 'package:app/utils/show_modal.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

class HeaderContent extends StatefulWidget {
  final String profilePicture;
  const HeaderContent(this.profilePicture, {Key? key}) : super(key: key);

  @override
  State<HeaderContent> createState() => _HeaderContentState();
}

class _HeaderContentState extends State<HeaderContent> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TrainingPlan? _newTrainingPlan;

  Future<String?> fetchNewTrainingPlan() async {
    showLoadingPopup(context, 'Creating new training plan...');
    // wait for 2 seconds
    await Future.delayed(const Duration(seconds: 2));
    try {
      _newTrainingPlan = await TrainingPlan.getNew();
    } catch (err) {
      hideLoadingPopup(context);
      return err.toString();
    }
    hideLoadingPopup(context);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Container(
              decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 15,
                    spreadRadius: 6)
              ]),
              child: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(widget.profilePicture),
                radius: 50.0,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 100,
                    child: NavbarText(
                        name: 'Homepage',
                        route: RouteNames.homePage.name,
                        icon: HeaderIcons.home),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: 100,
                    child: NavbarText(
                        name: 'User info',
                        route: RouteNames.userInfoPage.name,
                        icon: HeaderIcons.profile),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 100,
                    child: NavbarText(
                        name: 'Settings',
                        route: RouteNames.settingsPage.name,
                        icon: HeaderIcons.category),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: 100,
                    child: NavbarText(
                        name: 'Messages',
                        route: RouteNames.messagesPage.name,
                        icon: HeaderIcons.notify),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    child: POTButton(
                      width: 180,
                      height: 22,
                      text: 'Create new training plan',
                      callback: () async {
                        final String? err = await fetchNewTrainingPlan();
                        if (err != null) {
                          // TODO show error
                        } else {
                          showModal(
                              context,
                              BaseFormModal(
                                child: CreateTrainingPlanForm(
                                  formKey: _formKey,
                                  model: _newTrainingPlan!,
                                  child: CreateTrainingPlanFormBody(
                                      formKey: _formKey,
                                      instance: _newTrainingPlan!,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.5),
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                              ));
                        }
                      },
                      red: true,
                      textStyle: POTTextStyles.navbarText__active,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
