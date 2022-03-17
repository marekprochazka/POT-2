import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class NavbarText extends StatelessWidget {
  final String name;
  final String route;
  final IconData icon;
  final bool active;
  const NavbarText(
      {Key? key,
      required this.name,
      required this.route,
      required this.icon,
      this.active = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            size: 19.0,
            color: active ? POTColors.tertiary : POTColors.white,
          ),
          const SizedBox(
            width: 6,
          ),
          Text(
            name,
            style: active
                ? POTTextStyles.navbarText__active
                : POTTextStyles.navbarText,
          )
        ],
      ),
    );
  }
}
