import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/account_model.dart';
import 'package:my_finance_flutter/core/provider/repository/account/account_repository.dart';
import 'package:my_finance_flutter/ui/common/base/base_bloc.dart';
import 'package:provider/src/provider.dart';

class AccountCreateBloc extends BaseBloc {
  static AccountCreateBloc of(BuildContext context) =>
      Provider.of<AccountCreateBloc>(context);

  final AccountRepository accountRepository;

  AccountCreateBloc({
    this.accountRepository,
  });

  @override
  List<SingleChildCloneableWidget> get dependencies => [];

  Future saveAccount(AccountModel account) {
    return accountRepository.save(account);
  }
}