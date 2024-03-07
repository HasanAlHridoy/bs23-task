part of 'repository_list_bloc.dart';

@immutable
abstract class RepositoryListState {}

class RepositoryListInitialState extends RepositoryListState {}

class RepositoryListLoadedState extends RepositoryListState {
  final List repositoryList;

  RepositoryListLoadedState(this.repositoryList);
}
