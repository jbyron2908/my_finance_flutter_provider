import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/operation/state_model.dart';
import 'package:my_finance_flutter/ui/common/base/screen/router.dart';

import 'screen.dart';

class OperationStateSelectionRoute extends BaseRoute {
  OperationStateSelectionRouteArgs routeArguments;

  OperationStateSelectionRoute({this.routeArguments});

  @override
  String get routePath => "/operation/state_selection";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    var arguments = routeSettings.arguments as OperationStateSelectionRouteArgs;

    return MaterialPageRoute<OperationStateModel>(
      builder: (context) => OperationStateSelectionScreen(arguments),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => this.routeArguments;
}

class OperationStateSelectionRouteArgs {
  int field1;

  OperationStateSelectionRouteArgs({
    this.field1,
  });
}