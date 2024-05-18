part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeCartNavigateEvent extends HomeEvent {}

class HomeWishListNavigateEvent extends HomeEvent {}

class HomeCartButtonClickedEvent extends HomeEvent {
  final FruitModel cartedFruit;

  HomeCartButtonClickedEvent({required this.cartedFruit});
}

class HomeWishListButtonClickedEvent extends HomeEvent {
  final FruitModel wishedFruit;

  HomeWishListButtonClickedEvent({required this.wishedFruit});
}
