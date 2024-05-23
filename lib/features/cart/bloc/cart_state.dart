part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

sealed class CartActionState extends CartState {}

final class CartInitial extends CartState {}

final class CartLoadingState extends CartState {}

final class CartLoadedSuccessState extends CartState {
  final List<FruitModel> cartedFruits;

  CartLoadedSuccessState({required this.cartedFruits});
}

final class CartErrorState extends CartState {}

final class CartRemoveFruitState extends CartActionState {}
