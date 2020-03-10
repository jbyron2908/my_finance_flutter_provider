import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/operation/operation_repository.dart';
import 'package:my_finance_flutter/ui/common/base/base_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

class OperationListBloc extends BaseBloc {
  static OperationListBloc of(BuildContext context) =>
      Provider.of<OperationListBloc>(context);

  OperationRepository operationRepository;

  OperationListBloc({this.operationRepository});

  @override
  List<SingleChildCloneableWidget> get dependencies => [
        StreamProvider.value(
          value: operationRepository.watchFilter(1),
        )
      ];
}
