part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class GetSearchEvent extends SearchEvent {
  final String saerch;
  final bool isenglish;

  GetSearchEvent(this.saerch, this.isenglish);
}
