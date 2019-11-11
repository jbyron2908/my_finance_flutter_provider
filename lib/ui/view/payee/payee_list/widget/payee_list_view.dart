import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/view/payee/payee_create/screen/payee_create_route.dart';
import 'package:my_finance_flutter/ui/view/payee/payee_list/widget/payee_list.dart';

class PayeeListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payees"),
      ),
      body: Container(
        child: PayeeList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _navigateToPayeeCreate(context),
      ),
    );
  }

  void _navigateToPayeeCreate(BuildContext context) {
    AppRouter.navigateTo(context, PayeeCreateRoute());
  }
}
