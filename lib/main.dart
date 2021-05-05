import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Screens & Routes
import 'package:shop_app/screens/auth_screen.dart'; // AuthScreen
import 'package:shop_app/screens/cart_screen.dart'; // CartScreen
import 'package:shop_app/screens/orders_screen.dart'; // OrdersScreen
import 'package:shop_app/screens/edit_product_screen.dart'; // EditProductScreen
import 'package:shop_app/screens/product_detail_screen.dart'; // ProductDetailScreen
import 'package:shop_app/screens/products_overview_screen.dart'; // ProductsOverviewScreen

// Providers
import 'package:shop_app/providers/auth.dart'; // Auth
import 'package:shop_app/providers/cart.dart'; // Cart
import 'package:shop_app/providers/orders.dart'; // Orders
import 'package:shop_app/providers/products.dart'; // Products
import 'package:shop_app/screens/user_products_screen.dart'; // UserProductsScreen

// Run the app
void main() => runApp(MyApp());

// Main
class MyApp extends StatelessWidget {
  // build
  @override
  Widget build(BuildContext context) {
    // return
    return MultiProvider(
      // Providers
      providers: [
        // Auth
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        // Products
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (ctx) => Products(null, null, []),
          update: (ctx, auth, previousProducts) => Products(
            auth.token,
            auth.userId,
            previousProducts == null ? [] : previousProducts.items,
          ),
        ),
        // Cart
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        // Orders
        ChangeNotifierProxyProvider<Auth, Orders>(
          create: (ctx) => Orders(null, []),
          update: (ctx, auth, previousOrders) => Orders(
            auth.token,
            previousOrders == null ? [] : previousOrders.orders,
          ),
        )
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          // Title
          title: 'MyShop App',

          // Theme
          theme: ThemeData(
            primarySwatch: Colors.pink,
            accentColor: Colors.yellowAccent,
            fontFamily: 'Lato',
          ),

          // Home
          home: !auth.isAuth ? AuthScreen() : ProductsOverviewScreen(),

          // routes
          routes: {
            CartScreen.routeName: (ctx) => CartScreen(),
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
            EditProductScreen.routeName: (ctx) => EditProductScreen(),
            UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            // AuthScreen.routeName : (ctx) => AuthScreen(),
            // ProductsOverviewScreen.routeName: (ctx) => ProductsOverviewScreen(),
          },
        ),
      ),
    );
  }
}
