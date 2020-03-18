import 'dart:io';

import 'package:flutter/material.dart';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/account/account_dao.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/account/account_table.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/category/category_dao.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/category/category_table.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/operation/operation_dao.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/operation/operation_table.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/payee/payee_dao.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/payee/payee_table.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/profile/profile_dao.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/profile/profile_table.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/tag/tag_dao.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/tag/tag_table.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

part 'database_client.g.dart';

@UseMoor(
  tables: [
    ProfileTable,
    AccountTable,
    CategoryTable,
    OperationTable,
    PayeeTable,
    TagTable,
  ],
  daos: [
    ProfileDao,
    AccountDao,
    CategoryDao,
    OperationDao,
    PayeeDao,
    TagDao,
  ],
)
class DatabaseClient extends _$DatabaseClient {
  static SingleChildWidget buildProvider() =>
      Provider.value(value: DatabaseClient());

  static DatabaseClient of(BuildContext context) =>
      Provider.of<DatabaseClient>(context, listen: false);

  DatabaseClient() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await path_provider.getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}
