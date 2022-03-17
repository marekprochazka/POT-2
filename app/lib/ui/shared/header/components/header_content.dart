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
          children: const <Widget>[
            NavbarText(
                name: 'Homepage',
                route: '',
                icon: HeaderIcons.home,
                active: true),
            SizedBox(
              height: 20,
            ),
            NavbarText(name: 'Settings', route: '', icon: HeaderIcons.category)
          ],
        ),
        const SizedBox(
          width: 40,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            NavbarText(name: 'User info', route: '', icon: HeaderIcons.profile),
            SizedBox(
              height: 20,
            ),
            NavbarText(name: 'Messages', route: '', icon: HeaderIcons.notify)
          ],
        ),
      ],
    );
  }
}
