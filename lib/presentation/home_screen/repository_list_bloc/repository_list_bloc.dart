import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bs23_task/data/repositories/repository_details/repository_details.dart';
import 'package:bs23_task/data/repositories/repository_details/repository_interface.dart';
import 'package:meta/meta.dart';

part 'repository_list_event.dart';

part 'repository_list_state.dart';

class RepositoryListBloc extends Bloc<RepositoryListEvent, RepositoryListState> {
  RepositoryListBloc() : super(RepositoryListInitialState()) {
    final RepositoryInterface repositoryInterface = RepositoryData();
    on<RepositoryListEvent>((event, emit) async {
      emit(RepositoryListInitialState());
      var repoList = await repositoryInterface.getRepositoryData('Flutter');
      emit(RepositoryListLoadedState(repoList['items']));
    });
  }
}
