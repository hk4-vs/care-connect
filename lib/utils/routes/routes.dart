import 'package:flutter/material.dart';

import '../../views/onboarding/onboarding_view.dart';
import '../../views/sign-in-create-account/complete-profile/complete_profile_view.dart';
import '../../views/sign-in-create-account/create-account/create_account_view.dart';
import '../../views/sign-in-create-account/new-password/new_password_view.dart';
import '../../views/sign-in-create-account/sign-in/sign_in_view.dart';
import '../../views/sign-in-create-account/verify/verify_code_view.dart';
import '../../views/welcome/welcome_view.dart';
import 'route_names.dart';

class Routes {
  static Route<dynamic> genrateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.onboardingView:
        return MaterialPageRoute(builder: (context) => const OnboardingView());
      case RouteNames.welcomeView:
        return MaterialPageRoute(builder: (context) => const WelcomeView());
      case RouteNames.createAccountView:
        return MaterialPageRoute(
            builder: (context) => const CreateAccountView());
      case RouteNames.signInView:
        return MaterialPageRoute(builder: (context) => const SignInView());

      case RouteNames.verifyCodeView:
        return MaterialPageRoute(builder: (context) => const VerifyCodeView());
      case RouteNames.newPasswordView:
        return MaterialPageRoute(builder: (context) => const NewPasswordView());
      case RouteNames.completeProfileView:
        return MaterialPageRoute(builder: (context) => const CompleteProfileView());

      default:
        return MaterialPageRoute(builder: (context) => const OnboardingView());
    }
  }
}
