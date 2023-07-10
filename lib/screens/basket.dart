import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';

import '../form_input.dart';
import '../shop.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Корзина', style: TextStyle(fontSize: 24), textAlign: TextAlign.center,),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: _CartList(),
              ),
            ),
            const Divider(height: 4, color: Colors.black),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _CartTotal()
              ],)
          ],
        ),
      ),
    );
  }
}

PriceFormatter prices = PriceFormatter();

class PopupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return PopupMenuButton(
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
                prices = DiscountLevelOne();
                //prices.price = double.parse(stdin.readLineSync()!);
                //prices.discountPrice();
                prices.debugprint();
                break;
              case 2:
                prices = DiscountLevelTwo();
                //prices.price = double.parse(stdin.readLineSync()!);
                //prices.discountPrice();
                prices.debugprint();
                break;
              case 3:
                prices = DiscountLevelThree();
                //prices.price = double.parse(stdin.readLineSync()!);
                //prices.discountPrice();
                prices.debugprint();
                break;
              default:
                prices = DiscountLevelZero();
                //prices.price = double.parse(stdin.readLineSync()!);
                //prices.discountPrice();
                prices.debugprint();
                break;
            }
          }
      );
  }
}

class _CartList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.titleLarge;
    var cart = context.watch<CartModel>();

    return ListView.builder(
      itemCount: cart.items.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.done),
        /*trailing: IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: () {
            cart.remove(cart.items[index]);
          },
        ),*/
        title: Row(
          children: [
            Text(
              cart.items[index].name,
              style: itemNameStyle,
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                cart.remove(cart.items[index]);
              },
            ),
            Text('${itemCounts.values.elementAt(index)}'),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                cart.add(cart.items[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hugeStyle =
    Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16);

    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PopupButton(),
            const SizedBox(width: 24),
            Consumer<CartModel>(
                builder: (context, cart, child) =>
                    Text('Цена без скидки: ${cart.totalPrice.toDouble().toStringAsFixed(2)} р.'
                        '\nСкидка составляет: ${prices.discountPercent.toInt()} %'
                        '\nЦена со скидкой: ${(cart.totalPrice.toDouble() * (1 - prices.discountPercent / 100)).toStringAsFixed(2)} р.', style: hugeStyle)),
            const SizedBox(width: 24),
            FilledButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return PersonalInfoDialog();
                  },
                );
                //ScaffoldMessenger.of(context).showSnackBar(
                //    const SnackBar(content: Text('Buying not supported yet.')));
              },
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              child: const Text('BUY'),
            ),
          ],
        ),
      ),
    );
  }
}