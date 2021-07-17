import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:dellyshop/Data/Repository/IRepository.dart';
import 'package:dellyshop/models/CategoyShopsModel/CategoryShopsModel.dart';
import 'package:dellyshop/models/Sliders.dart/Sliders.dart';

import 'package:dellyshop/models/category_models.dart';
import 'package:meta/meta.dart';
import 'package:dellyshop/injection.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());
  var repo = sl.get<IRepository>();
  CategoriesModel categoriesModel;
  Sliders sliders;
  CategoryShopsModel categoryShopsModel;

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is GetCategoriesEvent) {
      // yield Loading();
      try {
        var response = await repo.iHttpHlper.getrequest("/Categories");
        categoriesModel = categoriesModelFromJson(response);
        yield GetCategoriesState(categoriesModel);
        add(GetSlider());
      } catch (e) {
        yield Error(e.toString());
      }
    }
    if (event is GetSlider) {
      try {
        var response = await repo.iHttpHlper.getrequest("/GetSliders");
        sliders = slidersFromJson(response);
        yield GetSlidersState(sliders);
      } catch (e) {
        yield Error(e.toString());
      }
    }
    if (event is GetCategoryShopsEvent) {
      yield Loading();
      try {
        var response = await repo.iHttpHlper
            .getrequest("/Shops?categories_id=${event.id}");
      categoryShopsModel = categoryShopsModelFromJson(response);
        yield GetCategoryShopsState(categoryShopsModel);
      } catch (e) {
        yield Error(e.toString());
      }
    }
  }
}
