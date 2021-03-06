import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/form/screen/category_form_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/selection/widget/category_parent_selection_item.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/selection/widget/category_selection_item.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/widget/category_list.dart';

class CategorySelectionView extends StatelessWidget {
  const CategorySelectionView({
    Key key,
    @required this.selectParent,
  }) : super(key: key);

  final bool selectParent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Category'),
      ),
      body: CategoryList(
        itemBuilder: (context, categoryItem) => selectParent
            ? CategoryParentSelectionItem(
                categoryItem: categoryItem,
              )
            : CategorySelectionItem(
                categoryItem: categoryItem,
              ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _navigateToCategoryForm(context),
      ),
    );
  }

  void _navigateToCategoryForm(BuildContext context) {
    CategoryFormRoute(
      argument: CategoryFormRouteArgs.create(),
    ).navigateIntoTab(context);
  }
}
