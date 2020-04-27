import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/form/screen/profile_form_screen.dart';

class ProfileFormRoute extends BaseRoute<ProfileFormScreenArgs> {
  ProfileFormRoute({ProfileFormScreenArgs argument})
      : super(argument: argument);

  @override
  String get routePath => "/manager/profile/form";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => ProfileFormScreen(),
      settings: routeSettings,
    );
  }
}