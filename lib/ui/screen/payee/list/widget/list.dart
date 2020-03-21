import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/payee/model.dart';
import 'package:my_finance_flutter/ui/screen/payee/widgets/item.dart';
import 'package:provider/provider.dart';

class PayeeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<List<PayeeModel>>(
      builder: (_, payeeList, child) => ListView.builder(
        itemCount: payeeList.length,
        itemBuilder: (context, index) => PayeeItem(
          payee: payeeList[index],
        ),
      ),
    );
  }
}