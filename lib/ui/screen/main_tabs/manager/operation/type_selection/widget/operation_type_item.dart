import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/operation/operation_type_model.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/router/main_tab_router.dart';

class OperationTypeItem extends StatelessWidget {
  OperationTypeItem({
    Key key,
    @required this.operationType,
  }) : super(key: key);

  final OperationTypeModel operationType;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        operationType.title,
      ),
      onTap: () => MainTabRouter.of(context).pop(operationType),
    );
  }
}
