import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:posttest2_068_rahmayanti/provider/cart_provider.dart';
import 'package:posttest2_068_rahmayanti/provider/order_provider.dart';
import 'package:posttest2_068_rahmayanti/widgets/cart_item.dart';

import '../routes/routes.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool _isordered = false;
  Widget alertDialog() {
    return const AlertDialog(
      title: Center(
        child: Text("Order Accepted!"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    var cart = Provider.of<CartProvider>(context);
    var order = Provider.of<OrderProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart",
          style: TextStyle(fontSize: 22),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton(
              onPressed: () {
                order.addOrder(
                    cart.cartItems.values.toList(), cart.totalAmount);
                cart.clearCart();
                setState(() {
                  _isordered = !_isordered;
                });
                Timer(const Duration(seconds: 2), () {
                  setState(() {
                    _isordered = !_isordered;
                    Navigator.of(context)
                        .pushReplacementNamed(Routes.orderScreen);
                  });
                });
              },
              child: const Text(
                "ORDER NOW",
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Stack(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: const EdgeInsets.all(0),
                child: SizedBox(
                  height: _screenSize.height * 0.08,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 4, left: 15.0),
                        child: Text(
                          "Total",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Chip(
                          backgroundColor: Colors.indigo,
                          label: Text(
                            cart.totalAmount.toStringAsFixed(2),
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: cart.cartItems.isEmpty
                  ? const Center(
                      child: Text(
                        "Cart's Empty",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.indigo,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  : ListView.builder(
                      itemCount: cart.cartItems.length,
                      itemBuilder: (context, index) => CartItem(
                          productId: cart.cartItems.values.toList()[index].id,
                          productName:
                              cart.cartItems.values.toList()[index].productName,
                          price: cart.cartItems.values.toList()[index].price,
                          imgUrl: cart.cartItems.values.toList()[index].imgUrl,
                          quantity:
                              cart.cartItems.values.toList()[index].quantity),
                    ),
            ),
          ],
        ),
        Positioned(
          child: Center(
            child: _isordered ? alertDialog() : Container(),
          ),
        ),
      ]),
    );
  }
}
