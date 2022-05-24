import 'package:app/constants.dart';
import 'package:app/models/header_icons.dart';
import 'package:app/ui/base/base_form/base_form.dart';
import 'package:app/ui/base/base_modal/base_modal.dart';
import 'package:app/ui/shared/buttons/pot_button.dart';
import 'package:app/ui/shared/header/components/create_training_plan_form.dart';
import 'package:app/ui/shared/header/components/navbar_text.dart';
import 'package:app/utils/show_modal.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HeaderContent extends StatelessWidget {
  final String profilePicture;
  HeaderContent(this.profilePicture, {Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                backgroundImage: CachedNetworkImageProvider(profilePicture),
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
                      callback: () => showModal(
                          context,
                          BaseFormModal(
                            child: CreateTrainingPlanForm(
                              formKey: _formKey,
                              child: CreateTrainingPlanFormBody(formKey: _formKey),
                            ),
                            height: MediaQuery.of(context).size.height * 0.8,
                          )),
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
