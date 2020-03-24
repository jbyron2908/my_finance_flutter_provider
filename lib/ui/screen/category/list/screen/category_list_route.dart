import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_router.dart';
import 'package:my_finance_flutter/ui/screen/category/list/screen/category_list_screen.dart';

class CategoryListRoute extends BaseRoute {
  @override
  String get routePath => "/category/list";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => CategoryListScreen(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}