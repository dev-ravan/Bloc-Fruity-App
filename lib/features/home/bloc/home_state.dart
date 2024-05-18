part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

sealed class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeLoadedSuccessState extends HomeState {
  final List<FruitModel> fruitsList;
  HomeLoadedSuccessState({required this.fruitsList});
}

final class HomeErrorState extends HomeState {}

final class HomeNavigateToCartActionState extends HomeActionState {}

final class HomeNavigateToWishListActionState extends HomeActionState {}

final class HomeAddToWishListActionState extends HomeActionState {}

final class HomeAddToCartActionState extends HomeActionState {}

final class HomeCartClickedState extends HomeState {}

final class HomeWishListClickedState extends HomeState {}
