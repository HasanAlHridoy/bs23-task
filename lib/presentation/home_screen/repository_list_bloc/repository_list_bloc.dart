import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bs23_task/data/database/boxes.dart';
import 'package:bs23_task/data/repositories/repository_details/repository_details.dart';
import 'package:bs23_task/data/repositories/repository_details/repository_interface.dart';
import 'package:bs23_task/domain/common_functions/common_functions.dart';
import 'package:bs23_task/domain/hive_functions/hive_functions.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';

part 'repository_list_event.dart';

part 'repository_list_state.dart';

class RepositoryListBloc extends Bloc<RepositoryListEvent, RepositoryListState> {
  RepositoryListBloc() : super(RepositoryListInitialState()) {
    final RepositoryInterface repositoryInterface = RepositoryData();
    final Box repositoryBox = Boxes().repositoryBox;
    var getRepositoryData;
    on<RepositoryListEvent>((event, emit) async {
      emit(RepositoryListInitialState());
      if (repositoryBox.isEmpty) {
        var repoList = await repositoryInterface.getRepositoryData('Flutter');
        /*--------------------------Set Repository Data----------------- */
        await repositoryBox.put("repositoryBox", jsonEncode(repoList));
      }
      /*--------------------------Get Repository Data----------------- */
      getRepositoryData = HiveFunctions().getRepositoryDataFromHive();
      emit(RepositoryListLoadedState(getRepositoryData['items']));
    });
    on<RepositorySearchByStarCountEvent>((event, emit) async {
      List<int> items = [];
      List sortedItems = [];
      for (int i = 0; i < getRepositoryData['items'].length; i++) {
        items.add(getRepositoryData['items'][i]['stargazers_count']);
      }
      List<int> sortedList = CommonFunctions().searchByStart(items);

      for (int i = 0; i < sortedList.length; i++) {
        for (int j = 0; j < getRepositoryData['items'].length; j++) {
          if (sortedList[i] == getRepositoryData['items'][j]['stargazers_count']) {
            sortedItems.add(getRepositoryData['items'][j]);
          }
        }
      }
      emit(RepositoryListLoadedState(sortedItems));
    });
    on<RepositorySearchByUpdatedAtEvent>((event, emit) async {
      List<DateTime> items = [];
      List sortedItems = [];
      for (int i = 0; i < getRepositoryData['items'].length; i++) {
        items.add(DateTime.parse(getRepositoryData['items'][i]['updated_at']));
      }
      List<DateTime> sortedList = CommonFunctions().searchByDates(items);
      for (int i = 0; i < sortedList.length; i++) {
        for (int j = 0; j < getRepositoryData['items'].length; j++) {
          if (sortedList[i] == DateTime.parse(getRepositoryData['items'][j]['updated_at'])) {
            sortedItems.add(getRepositoryData['items'][j]);
          }
        }
      }
      log(jsonEncode(sortedItems));
      print(sortedList);

      emit(RepositoryListLoadedState(sortedItems));
    });
  }
}
