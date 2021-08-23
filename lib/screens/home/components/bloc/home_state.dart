part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class Loading extends HomeState {}

class Error extends HomeState {
  final String error;
  Error(this.error);
}

class GetCategoriesState extends HomeState {
  final CategoriesModel categoriesModel;
  final bool islogin;
  GetCategoriesState(this.categoriesModel, this.islogin);
}

class GetSlidersState extends HomeState {
  final Sliders sliders;
  GetSlidersState(this.sliders);
}

class GetCategoryShopsState extends HomeState {
  final CategoryShopsModel categoryShopsModel;
  GetCategoryShopsState(this.categoryShopsModel);
}

class GetDiscountItemsState extends HomeState {
  final List<ItemsWithDiscount> discountItems;
  GetDiscountItemsState(this.discountItems);
}
