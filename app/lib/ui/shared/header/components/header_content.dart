import 'package:app/constants.dart';
import 'package:app/models/header_icons.dart';
import 'package:app/ui/shared/header/components/navbar_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HeaderContent extends StatelessWidget {
  final String profilePicture;
  const HeaderContent(this.profilePicture, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(profilePicture),
            radius: 40.0,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  <Widget>[
            NavbarText(name: 'Homepage', route: RouteNames.homePage.name, icon: HeaderIcons.home),
            const SizedBox(
              height: 20,
            ),
            NavbarText(name: 'Settings', route: RouteNames.settingsPage.name ,icon: HeaderIcons.category)
          ],
        ),
        const SizedBox(
          width: 40,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  <Widget>[
            NavbarText(name: 'User info', route: RouteNames.userInfoPage.name, icon: HeaderIcons.profile),
            const SizedBox(
              height: 20,
            ),
            NavbarText(name: 'Messages', route: RouteNames.messagesPage.name, icon: HeaderIcons.notify)
          ],
        ),
      ],
    );
  }
}
