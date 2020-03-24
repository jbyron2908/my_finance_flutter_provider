import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/core/provider/repository/category/repository.dart';
import 'package:my_finance_flutter/ui/screen/category/create/widget/form.dart';

class CategoryCreateView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var categoryRepository = CategoryRepository.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Create Category"),
      ),
      body: CategoryCreateForm(onSubmit: (CategoryModel category) async {
        await categoryRepository.save(category);
        Navigator.of(context).pop();
      }),
    );
  }
}
