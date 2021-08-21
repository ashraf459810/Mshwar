import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dellyshop/Data/Repository/IRepository.dart';
import 'package:dellyshop/models/SearchResponse/Search.dart';

import 'package:meta/meta.dart';

import '../../../../injection.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial());
  var repo = sl.get<IRepository>();
  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is GetSearchEvent) {
      yield Loading();
      try {
        if (event.isenglish) {
          var result = await repo.getrequest(
              ([response]) => searchResponseFromJson(response),
              "/Items?title_en=${event.saerch}");
          yield GetSearchState(result, true);
        } else {
          var result = await repo.getrequest(
              ([response]) => searchResponseFromJson(response),
              "/Items?title=${event.saerch}");
          yield GetSearchState(result, false);
        }
      } catch (error) {
        yield Error(error.toString());
      }
    }
  }
}
