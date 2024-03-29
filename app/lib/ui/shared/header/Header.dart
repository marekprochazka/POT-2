import 'package:app/constants.dart';
import 'package:app/ui/shared/header/components/header_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/models/data/user.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context, listen: false);

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: POTColors.primary50, blurRadius: 5, offset: Offset(0, 9))
        ],
        gradient: POTGradients.defaultGradient,
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Center(
                child: Text(
              user.username!,
              style: POTTextStyles.navbarTitle,
            )),
          ),
          SizedBox(
              width: double.infinity, child: HeaderContent(user.profilePicture))
        ],
      ),
    );
  }
}
