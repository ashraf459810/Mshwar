part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class GetSearchState extends SearchState {
  final SearchResponse searchResponse;
  final bool isenglish;

  GetSearchState(this.searchResponse, this.isenglish);
}

class Loading extends SearchState {}

class Error extends SearchState {
  final String error;

  Error(this.error);
}
