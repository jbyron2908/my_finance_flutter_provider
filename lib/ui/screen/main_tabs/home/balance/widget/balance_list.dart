import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/balance/widget/item/profile_item.dart';
import 'package:provider/provider.dart';

class BalanceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<List<ProfileModel>>(
      builder: (_, list, child) {
        return ListView.separated(
          padding: EdgeInsets.symmetric(
            vertical: 16.0,
          ),
          itemCount: list.length,
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey,
          ),
          itemBuilder: (context, index) => ProfileItem(
            profile: list[index],
          ),
        );
      },
    );
  }
}
