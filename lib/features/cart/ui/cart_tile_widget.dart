import 'package:flutter/material.dart';
import 'package:fruity/features/cart/bloc/cart_bloc.dart';
import 'package:fruity/features/home/models/fruit_model.dart';

class CartTileWidget extends StatelessWidget {
  final FruitModel fruitDetails;
  final CartBloc cartBloc;
  const CartTileWidget(
      {super.key, required this.fruitDetails, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black45),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(6), topLeft: Radius.circular(6)),
              image: DecorationImage(
                image: NetworkImage(
                  fruitDetails.image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(fruitDetails.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  Text("Price : \$ ${fruitDetails.price}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.grey))
                ],
              ),
              IconButton(
                  onPressed: () {
                    cartBloc
                        .add(CartRemoveFruitEvent(removeFruit: fruitDetails));
                  },
                  icon: const Icon(Icons.delete_outline))
            ],
          )
        ],
      ),
    );
  }
}
