import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_router.dart';
import 'package:my_finance_flutter/ui/screen/account/list/screen/account_list_screen.dart';

class AccountListRoute extends BaseRoute {
  @override
  String get routePath => "/account/list";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => AccountListScreen(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}