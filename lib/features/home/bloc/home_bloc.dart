import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:fruity/data/cart_list.dart';
import 'package:fruity/data/fruits_list.dart';
import 'package:fruity/data/wishlist.dart';
import 'package:fruity/features/home/models/fruit_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeCartNavigateEvent>(homeCartNavigateEvent);
    on<HomeWishListNavigateEvent>(homeWishListNavigateEvent);
    on<HomeCartButtonClickedEvent>(homeCartButtonClickedEvent);
    on<HomeWishListButtonClickedEvent>(homeWishListButtonClickedEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(HomeLoadedSuccessState(fruitsList: fruits));
  }

  FutureOr<void> homeCartNavigateEvent(
      HomeCartNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToCartActionState());
  }

  FutureOr<void> homeWishListNavigateEvent(
      HomeWishListNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToWishListActionState());
  }

  FutureOr<void> homeCartButtonClickedEvent(
      HomeCartButtonClickedEvent event, Emitter<HomeState> emit) {
    cartList.add(event.cartedFruit);
    emit(HomeAddToCartActionState());
    print("Fruit added to the cart");
  }

  FutureOr<void> homeWishListButtonClickedEvent(
      HomeWishListButtonClickedEvent event, Emitter<HomeState> emit) {
    wishList.add(event.wishedFruit);
    emit(HomeAddToWishListActionState());
    print("Fruit added to the wishlist");
  }
}
