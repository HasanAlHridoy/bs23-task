part of 'repository_list_bloc.dart';

@immutable
abstract class RepositoryListEvent {}

class RepositoryListLoadedEvent extends RepositoryListEvent {}

class RepositorySearchByStarCountEvent extends RepositoryListEvent {}

class RepositorySearchByUpdatedAtEvent extends RepositoryListEvent {}

class SchedulerEvent extends RepositoryListEvent {}
