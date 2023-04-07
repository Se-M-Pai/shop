import 'dart:io';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/screens/item_page.dart';
import 'package:shop/shop.dart';
import 'package:shop/screens/list_of_products.dart';
import 'package:shop/screens/basket.dart';
import 'package:shop/theme.dart';

import 'models/cart.dart';
import 'models/catalog.dart';

late Item productScreen;

void main(List<String> arguments) {
  runApp(const MyApp());
}

GoRouter router() {
  return GoRouter(
    initialLocation: '/catalog',
    routes: [
      GoRoute(
        path: '/catalog',
        builder: (context, state) => const MyCatalog(),
        routes: [
          GoRoute(
            path: 'cart',
            builder: (context, state) => const MyCart(),
          ),
          GoRoute(
            path: 'product',
            builder: (context, state) => ProductScreen(product: productScreen),
          )
        ],
      ),
    ],
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.
    return MultiProvider(
      providers: [
        Provider(create: (context) => CatalogModel()),
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            if (cart == null) throw ArgumentError.notNull('cart');
            cart.catalog = catalog;
            return cart;
          },
        ),
      ],
      child: MaterialApp.router(
        title: 'Provider Demo',
        theme: appTheme,
        routerConfig: router(),
      ),
    );
  }
}
/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future shop',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future shop on Dart/Flutter"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PopupMenuButton(
                  child: Container(
                    alignment: Alignment.center,
                    height: 56.0,
                    width: 56.0,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 4,
                              offset: Offset(0.0, 1.0),
                              color: Colors.black45
                          )
                        ],
                        color: Colors.white,
                        shape: BoxShape.rectangle
                    ),
                    child: Icon(
                      Icons.credit_card,
                      color: Colors.black54,
                    ),
                  ),
                  elevation: 40,
                  color: Colors.white70,
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text('Silver card'),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: Text('Gold card'),
                      value: 2,
                    ),
                    PopupMenuItem(
                      child: Text('Diamond card'),
                      value: 3,
                    ),
                  ],
                  onSelected: (value) {
                    switch(value){
                      case 1:
                        PriceFormatter prices = DiscountLevelOne();
                        //prices.price = double.parse(stdin.readLineSync()!);
                        //prices.discountPrice();
                        prices.debugprint();
                        break;
                      case 2:
                        PriceFormatter prices = DiscountLevelTwo();
                        //prices.price = double.parse(stdin.readLineSync()!);
                        //prices.discountPrice();
                        prices.debugprint();
                        break;
                      case 3:
                        PriceFormatter prices = DiscountLevelThree();
                        //prices.price = double.parse(stdin.readLineSync()!);
                        //prices.discountPrice();
                        prices.debugprint();
                        break;
                      default:
                        PriceFormatter prices = DiscountLevelZero();
                        //prices.price = double.parse(stdin.readLineSync()!);
                        //prices.discountPrice();
                        prices.debugprint();
                        break;
                    }
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/