import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/model/label/label_converter.dart';
import 'package:my_finance_flutter/core/model/label/label_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class LabelRepository {
  static SingleChildWidget buildProvider() =>
      ProxyProvider<DatabaseClient, LabelRepository>(
        update: (context, databaseClient, labelRepository) =>
            LabelRepository(databaseClient),
      );

  static LabelRepository of(BuildContext context) =>
      Provider.of<LabelRepository>(context, listen: false);

  LabelRepository(this._databaseClient) {
    _labelListStream = _databaseClient.labelDao.watchAll();
  }

  final DatabaseClient _databaseClient;

  Stream<List<LabelModel>> _labelListStream;
  Stream<List<LabelModel>> get labelListStream => _labelListStream;

  Future save(LabelModel model) async {
    return _databaseClient.labelDao.save(
      LabelConverter.toEntity(model),
    );
  }

  Future delete(LabelModel label) async {
    return _databaseClient.labelDao.markDelete(LabelConverter.toEntity(label));
  }
}
