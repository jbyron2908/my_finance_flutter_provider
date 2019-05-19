import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:my_finance_flutter/bloc/app/bloc.dart';
import 'package:my_finance_flutter/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/data_source/db/client/database_client_contract.dart';
import 'package:my_finance_flutter/data_source/graphql/client/graphql_client.dart';
import 'package:my_finance_flutter/data_source/graphql/client/graphql_client_contract.dart';
import 'package:my_finance_flutter/data_source/rest/client/rest_client.dart';
import 'package:my_finance_flutter/data_source/rest/client/rest_client_contract.dart';
import 'package:my_finance_flutter/repository/repository_provider.dart';
import 'package:my_finance_flutter/repository/repository_provider_contract.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  DatabaseClient _databaseClient = MyFinanceDatabaseClient();
  GraphQLClient _graphqlClient = MyFinanceGraphqlClient();
  RestClient _restClient = MyFinanceRestClient();

  RepositoryProvider repositoryProvider = MyFinanceRepositoryProvider();

  @override
  AppState get initialState => AppInitState();

  void appStarted() {
    dispatch(AppStartedEvent());
  }

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    if (event is AppStartedEvent) {
      await _databaseClient.setup();
      _graphqlClient.setup();
      _restClient.setup();
      repositoryProvider.setup(_graphqlClient, _restClient, _databaseClient);
      yield AppReadyState();
    }
  }
}
