part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetCategoriesEvent extends HomeEvent {}

class GetSlider extends HomeEvent {}

class GetCategoryShopsEvent extends HomeEvent {
  final String id;
  GetCategoryShopsEvent(this.id);
}

class GetDicountItemsEvent extends HomeEvent {
  final int size;
  GetDicountItemsEvent(this.size);
}
