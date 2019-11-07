import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_router.dart';
import 'package:my_finance_flutter/ui/view/tag/tag_list/tag_list_view.dart';

class TagListRoute extends BaseRoute {
  @override
  String get routePath => "/tag/list";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => TagListView(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}
