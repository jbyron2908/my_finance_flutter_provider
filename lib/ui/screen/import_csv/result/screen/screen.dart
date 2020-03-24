import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/result/bloc/bloc.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/result/widget/view.dart';

class ImportCsvResultScreen extends BaseScreen<ImportCsvResultBloc> {
  @override
  Widget build(BuildContext context) {
    return ImportCsvResultView();
  }

  @override
  ImportCsvResultBloc buildBloc(BuildContext context) {
    return ImportCsvResultBloc();
  }
}
