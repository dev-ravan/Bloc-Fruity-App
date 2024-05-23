part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveFruitEvent extends CartEvent {
  final FruitModel removeFruit;

  CartRemoveFruitEvent({required this.removeFruit});
}
