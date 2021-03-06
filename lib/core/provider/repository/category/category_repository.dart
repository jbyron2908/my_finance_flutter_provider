import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/model/category/category_converter.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class CategoryRepository {
  static SingleChildWidget buildProvider() =>
      ProxyProvider<DatabaseClient, CategoryRepository>(
        update: (context, databaseClient, postRepository) =>
            CategoryRepository(databaseClient),
      );

  static CategoryRepository of(BuildContext context) =>
      Provider.of<CategoryRepository>(context, listen: false);

  CategoryRepository(this._databaseClient) {
    _categoryListStream = _databaseClient.categoryDao.watchAll();
  }

  final DatabaseClient _databaseClient;

  Stream<List<CategoryModel>> _categoryListStream;
  Stream<List<CategoryModel>> get categoryListStream => _categoryListStream;

  Future save(CategoryModel category) async {
    return _databaseClient.categoryDao.save(
      CategoryConverter.toEntity(category),
    );
  }

  Future delete(CategoryModel category) async {
    return _databaseClient.categoryDao
        .markDelete(CategoryConverter.toEntity(category));
  }
}
