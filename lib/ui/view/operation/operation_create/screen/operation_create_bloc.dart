import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/core/model/operation/operation_model.dart';
import 'package:my_finance_flutter/core/model/operation/operation_state_model.dart';
import 'package:my_finance_flutter/core/model/operation/operation_type_model.dart';
import 'package:my_finance_flutter/core/provider/repository/operation/operation_repository.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/common/base/base_bloc.dart';
import 'package:my_finance_flutter/ui/view/account/account_selection/screen/account_selection_route.dart';
import 'package:my_finance_flutter/ui/view/category/category_selection/screen/category_selection_route.dart';
import 'package:my_finance_flutter/ui/view/operation/operation_state_selection/screen/operation_state_selection_route.dart';
import 'package:my_finance_flutter/ui/view/operation/operation_type_selection/screen/operation_type_selection_route.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class OperationCreateBloc extends BaseBloc {
  static OperationCreateBloc of(BuildContext context) =>
      Provider.of<OperationCreateBloc>(context, listen: false);

  final BuildContext context;
  final OperationRepository operationRepository;
  final OperationModel operation;

  GlobalKey<FormState> formKey;

  OperationCreateBloc({
    @required this.context,
    @required this.operationRepository,
    @required this.operation,
  });

  Future<OperationTypeModel> selectOperationType() async {
    return await AppRouter.navigateTo(context, OperationTypeSelectionRoute());
  }

  Future<OperationStateModel> selectOperationState() async {
    return await AppRouter.navigateTo(context, OperationStateSelectionRoute());
  }

  Future<CategoryModel> selectCategory() async {
    return await AppRouter.navigateTo(context, CategorySelectionRoute());
  }

  Future<AccountModel> selectAccount() async {
    return await AppRouter.navigateTo(context, AccountSelectionRoute());
  }

  void submit() async {
    FocusScope.of(context).requestFocus(FocusNode());
    formKey.currentState.save();
    await operationRepository.save(operation);
    Navigator.of(context).pop();
  }

  void cancel() async {
    Navigator.of(context).pop();
  }

  @override
  List<SingleChildWidget> get dependencies => [];
}
