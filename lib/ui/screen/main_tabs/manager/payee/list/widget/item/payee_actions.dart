import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_finance_flutter/ui/common/dialog_helper.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/list/bloc/payee_list_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/list/widget/item/payee_item.dart';

class PayeeActions extends StatelessWidget {
  const PayeeActions({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Slidable(
        actionPane: SlidableScrollActionPane(),
        actionExtentRatio: 0.15,
        actions: <Widget>[
          SlideAction(
            child: PayeeActionLeft(),
          ),
        ],
        secondaryActions: <Widget>[
          SlideAction(
            child: PayeeActionRight(),
          ),
        ],
        child: child,
      ),
    );
  }
}

class PayeeActionRight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: FlatButton(
        color: Color(0xffE4A854),
        child: Icon(
          Icons.edit,
          color: Colors.white70,
        ),
        onPressed: () {
          Slidable.of(context).close();
          _edit(context);
        },
      ),
    );
  }

  _edit(BuildContext context) {
    final payee = PayeeItem.payeeOf(context);
    final bloc = PayeeListBloc.of(context);
    bloc.editPayee(payee);
  }
}

class PayeeActionLeft extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: FlatButton(
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white70,
        ),
        onPressed: () async {
          await _delete(context);
          Slidable.of(context).close();
        },
      ),
    );
  }

  Future _delete(BuildContext context) async {
    var confirmation = await DialogHelper.showAlertDialog(
      context,
      title: "Delete payee",
      content: "Do you want to delete this payee?",
      confirmText: "Yes",
      cancelText: "No",
    );

    if (confirmation == true) {
      final payee = PayeeItem.payeeOf(context);
      final bloc = PayeeListBloc.of(context);
      await bloc.deletePayee(payee);
    }
  }
}