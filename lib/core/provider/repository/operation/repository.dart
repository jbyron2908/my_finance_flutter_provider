import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/database/client/client.dart';
import 'package:my_finance_flutter/core/data_source/storage/client/client.dart';
import 'package:my_finance_flutter/core/model/operation/converter.dart';
import 'package:my_finance_flutter/core/model/operation/model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class OperationRepository {
  static SingleChildWidget buildProvider() =>
      ProxyProvider<DatabaseClient, OperationRepository>(
        update: (context, databaseClient, operationRepository) =>
            OperationRepository(databaseClient),
      );

  static OperationRepository of(BuildContext context) =>
      Provider.of<OperationRepository>(context, listen: false);

  OperationRepository(this._databaseClient) {
    _operationListStream = _databaseClient.operationDao.watchAll();
  }

  Stream<List<OperationModel>> _operationListStream;
  Stream<List<OperationModel>> get operationListStream => _operationListStream;

  DatabaseClient _databaseClient;

  Future<int> save(OperationModel operation) async {
    operation.profile = operation.account.profile;
    await _saveDefaultValues(operation);
    return _databaseClient.operationDao
        .insert(OperationConverter.toEntity(operation));
  }

  Future _saveDefaultValues(OperationModel operation) async {
    var storageClient = StorageClient.instance;
    await storageClient.operationTypeDao.updateLastUsed(operation.type);
    await storageClient.operationStateDao.updateLastUsed(operation.state);
  }

  Stream<List<OperationModel>> watchFilter(int accountId) {
    return _databaseClient.operationDao.watchFilter(accountId);
  }
}