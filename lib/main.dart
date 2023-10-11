import 'package:care_connect/resources/themes/themes.dart';
import 'package:care_connect/views/allow-location/allow_location_view.dart';
import 'package:care_connect/views/book-appointment/book_appointment_view.dart';
import 'package:care_connect/views/book-appointment/select_package_view.dart';
import 'package:care_connect/views/dashboard/dashboard_view.dart';
import 'package:care_connect/views/explore/explore_view.dart';
import 'package:care_connect/views/home/home_view.dart';

import 'package:care_connect/views/onboarding/onboarding_view.dart';
import 'package:care_connect/views/sign-in-create-account/create-account/create_account_view.dart';
import 'package:care_connect/views/sign-in-create-account/sign-in/sign_in_view.dart';
import 'package:care_connect/views/sign-in-create-account/verify/verify_code_view.dart';
import 'package:flutter/material.dart';

import 'utils/routes/routes.dart';
import 'views/allow-location/location_manually_view.dart';
import 'views/doctor-details/doctor_details_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SelectPackageView(),
      theme: MyTheme.lightTheme(),
      onGenerateRoute: Routes.genrateRoute,
    );
  }
}
