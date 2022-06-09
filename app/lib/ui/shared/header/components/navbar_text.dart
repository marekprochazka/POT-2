import 'package:app/constants.dart';
import 'package:app/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class NavbarText extends StatelessWidget {
  final String name;
  final String route;
  final IconData icon;
  const NavbarText(
      {Key? key, required this.name, required this.route, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String activeRoute = RouteNames.getNameFromPath(
        Provider.of<POTRouter>(context, listen: false).router.location);
    return GestureDetector(
      onTap: () => context.goNamed(route),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            size: 19.0,
            color: route == activeRoute ? POTColors.tertiary : POTColors.white,
          ),
          const SizedBox(
            width: 6,
          ),
          Text(
            name,
            style: route == activeRoute
                ? POTTextStyles.navbarText__active
                : POTTextStyles.navbarText,
          )
        ],
      ),
    );
  }
}
