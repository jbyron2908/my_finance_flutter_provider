import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/profile_model.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/view/profile/widget/profile_item.dart';
import 'package:provider/provider.dart';

class ProfileSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<List<ProfileModel>>(
      builder: (_, list, child) => ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => AppRouter.pop(context, list[index]),
          child: ProfileItem(
            profile: list[index],
          ),
        ),
      ),
    );
  }
}