import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruity/features/cart/bloc/cart_bloc.dart';
import 'package:fruity/features/cart/ui/cart_tile_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case const (CartLoadedSuccessState):
              final successState = state as CartLoadedSuccessState;
              return ListView.builder(
                itemCount: successState.cartedFruits.length,
                itemBuilder: (context, index) => CartTileWidget(
                    fruitDetails: successState.cartedFruits[index],
                    cartBloc: cartBloc),
              );
            case const (CartLoadingState):
              return const Center(child: CircularProgressIndicator());
            case const (CartErrorState):
              return const Text("Something went wrong..!");

            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
