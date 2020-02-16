import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_router.dart';
import 'package:my_finance_flutter/ui/view/tag/tag_create/screen/tag_create_screen.dart';

class TagCreateRoute extends BaseRoute {
  @override
  String get routePath => "/tag/create";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => TagCreateScreen(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}