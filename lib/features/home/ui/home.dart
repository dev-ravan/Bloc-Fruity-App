import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruity/features/cart/ui/cart.dart';
import 'package:fruity/features/home/bloc/home_bloc.dart';
import 'package:fruity/features/home/ui/fruit_tile_widget.dart';
import 'package:fruity/features/wish_list/ui/wishlist.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc homeBloc = HomeBloc();
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToWishListActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const WishListScreen()));
        } else if (state is HomeNavigateToCartActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CartScreen()));
        } else if (state is HomeAddToWishListActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Fruit added to wishlist..!")));
        } else if (state is HomeAddToCartActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Fruit added to cart..!")));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case const (HomeLoadingState):
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          case const (HomeLoadedSuccessState):
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  "F r u i t y",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.white),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishListNavigateEvent());
                      },
                      icon: const Icon(Icons.favorite_outline,
                          color: Colors.white)),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeCartNavigateEvent());
                    },
                    icon: const Icon(Icons.shopping_cart_outlined,
                        color: Colors.white),
                  )
                ],
              ),
              body: ListView.builder(
                shrinkWrap: true,
                itemCount: successState.fruitsList.length,
                itemBuilder: (context, index) {
                  return FruitTileWidget(
                    fruitDetails: successState.fruitsList[index],
                    homeBloc: homeBloc,
                  );
                },
              ),
            );
          case const (HomeErrorState):
            return const Text("Something went wrong..!");
          default:
            return const SizedBox();
        }
      },
    );
  }
}
