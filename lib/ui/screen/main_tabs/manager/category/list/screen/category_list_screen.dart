import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/list/bloc/category_list_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/list/screen/category_list_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/list/widget/category_list_view.dart';

class CategoryListScreen
    extends BaseScreen<CategoryListBloc, CategoryListRouteArgs> {
  @override
  Widget build(BuildContext context) {
    return CategoryListView();
  }

  @override
  CategoryListBloc buildBloc(BuildContext context) {
    return CategoryListBloc(
      context: context,
    );
  }
}
