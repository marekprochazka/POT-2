import 'package:app/constants.dart';
import 'package:app/providers/login_state.dart';
import 'package:app/ui/pages/homepage/home_page.dart';
import 'package:app/ui/pages/log_in/login_page.dart';
import 'package:app/ui/pages/messages/messages_page.dart';
import 'package:app/ui/pages/settings/settings_page.dart';
import 'package:app/ui/pages/sign_in/signin_page.dart';
import 'package:app/ui/pages/training_plan/training_plan_page.dart';
import 'package:app/ui/pages/user_info/user_info_page.dart';
import 'package:go_router/go_router.dart';

class POTRouter {
  final LoginState loginState;

  POTRouter(this.loginState);

  late final router = GoRouter(
      refreshListenable: loginState,
      urlPathStrategy: UrlPathStrategy.path,
      routes: <GoRoute>[
        GoRoute(
            name: RouteNames.homePage.name,
            path: RouteNames.homePage.path,
            pageBuilder: (context, state) => NoTransitionPage<void>(
                key: state.pageKey, child: const HomePage())),
        GoRoute(
            name: RouteNames.messagesPage.name,
            path: RouteNames.messagesPage.path,
            pageBuilder: (context, state) => NoTransitionPage<void>(
                key: state.pageKey, child: const MessagesPage())),
        GoRoute(
            name: RouteNames.settingsPage.name,
            path: RouteNames.settingsPage.path,
            pageBuilder: (context, state) => NoTransitionPage<void>(
                key: state.pageKey, child: const SettingsPage())),
        GoRoute(
            name: RouteNames.userInfoPage.name,
            path: RouteNames.userInfoPage.path,
            pageBuilder: (context, state) => NoTransitionPage<void>(
                key: state.pageKey, child: const UserInfoPage())),
        GoRoute(
          name: RouteNames.loginPage.name,
          path: RouteNames.loginPage.path,
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: const LogInPage(), 
          ),
        ),
        GoRoute(
          name: RouteNames.signInPage.name,
          path: RouteNames.signInPage.path,
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: const SignInPage(), 
          ),
        ),
        GoRoute(
          name: RouteNames.trainingPlanPage.name,
          path: RouteNames.trainingPlanPage.path,
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: TrainingPlanPage(trainingPlanId: state.params['id']!,), 
          ),
          
        )
      ],
      errorBuilder: (context, state) => const HomePage(), 
      redirect: (state) {
        final loginLocation = state.namedLocation(RouteNames.loginPage.name);
        final loggingIn = state.subloc == loginLocation;
        final sighnInLocation = state.namedLocation(RouteNames.signInPage.name);
        final signingIn = state.subloc == sighnInLocation;
        final loggedIn = loginState.loggedIn;
        final homeLocation = state.namedLocation(RouteNames.homePage.name);

        if (!loggedIn && !loggingIn && !signingIn) return loginLocation;
        if (loggedIn && (loggingIn || signingIn)) return homeLocation;
        return null;
      });
}
