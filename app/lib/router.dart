import 'package:app/constants.dart';
import 'package:app/ui/pages/homePage/HomePage.dart';
import 'package:app/providers/loginState.dart';
import 'package:app/ui/pages/logIn/LogInPage.dart';
import 'package:app/ui/pages/signIn/SignInPage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class POTRouter {
  final LoginState loginState;

  POTRouter(this.loginState);

  late final router = GoRouter(
      refreshListenable: loginState,
      urlPathStrategy: UrlPathStrategy.path,
      routes: <GoRoute>[
        GoRoute(
            name: RouteNames.homePage,
            path: '/',
            pageBuilder: (context, state) => MaterialPage<void>(
                key: state.pageKey, child: const HomePage())),
        GoRoute(
          name: RouteNames.loginPage,
          path: '/login',
          pageBuilder: (context, state) => MaterialPage<void>(
            key: state.pageKey,
            child: const LogInPage(), 
          ),
        ),
        GoRoute(
          name: RouteNames.signInPage,
          path: '/sign-in',
          pageBuilder: (context, state) => MaterialPage<void>(
            key: state.pageKey,
            child: const SignInPage(), 
          ),
        ),
      ],
      errorBuilder: (context, state) => const HomePage(), 
      redirect: (state) {
        final loginLocation = state.namedLocation(RouteNames.loginPage);
        final loggingIn = state.subloc == loginLocation;
        final sighnInLocation = state.namedLocation(RouteNames.signInPage);
        final signingIn = state.subloc == sighnInLocation;
        final loggedIn = loginState.loggedIn;
        final homeLocation = state.namedLocation(RouteNames.homePage);

        if (!loggedIn && !loggingIn && !signingIn) return loginLocation;
        if (loggedIn && (loggingIn || signingIn)) return homeLocation;
        return null;
      });
}
