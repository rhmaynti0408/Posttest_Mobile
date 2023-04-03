import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:posttest2_068_rahmayanti/main%20copy.dart';
import 'package:posttest2_068_rahmayanti/provider/theme_provider.dart';
import 'package:posttest2_068_rahmayanti/screens/landing_page.dart';
import 'package:posttest2_068_rahmayanti/screens/login.dart';
import 'package:provider/provider.dart';

import './screens/orders.dart';
import './provider/order_provider.dart';
// import './widgets/navigator.dart';
// import './screens/landing_page.dart';
import './provider/cart_provider.dart';
// import './provider/theme_provider.dart';
import './screens/cart.dart';
import './screens/product_details/product_details.dart';
import './provider/product_provider.dart';
import './routes/routes.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import './screens/profile.dart';
// import './models/user.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // bool _darkMode = User.darkMode;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderProvider(),
        ),
      ],
      child: ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: Consumer<ThemeProvider>(
          builder: (context, provider, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Rahmayanti Book Shop',
            routes: {
              '/': (context) => LoginPage(),
              'main-page': (context) => LandingPage(),
              Routes.productDetails: (context) => const ProductDetails(),
              Routes.cartScreen: (context) => const CartScreen(),
              Routes.orderScreen: (context) => const OrderScreen(),
              Routes.profile: (context) => const Profile(),
            },
            theme: Provider.of<ThemeProvider>(context).currentTheme,
          ),
        ),
      ),
    );
  }
}
