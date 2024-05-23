import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fruity/data/cart_list.dart';
import 'package:fruity/features/home/models/fruit_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFruitEvent>(cartRemoveFruitEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) async {
    emit(CartLoadingState());
    await Future.delayed(
      const Duration(seconds: 2),
      () => emit(CartLoadedSuccessState(cartedFruits: cartList)),
    );
  }

  FutureOr<void> cartRemoveFruitEvent(
      CartRemoveFruitEvent event, Emitter<CartState> emit) {
    cartList.remove(event.removeFruit);
    emit(CartLoadedSuccessState(cartedFruits: cartList));
  }
}
