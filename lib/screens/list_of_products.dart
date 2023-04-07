import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shop/main.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/catalog.dart';

Map<int, Item> productViewed = {};
int selectedIndex = 0;

class MyCatalog extends StatelessWidget {
  const MyCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => MyStatefulCatalog();
}

class MyStatefulCatalog extends State<MyStatefulWidget> {
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
                  (context, index) => _MyListItem(index)),
        ),
      ],
    ),
    _MyListItemView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      debugPrint(productViewed.values.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text((selectedIndex == 0) ? 'Каталог' : 'Просмотренное', style: Theme.of(context).textTheme.titleLarge),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => context.go('/catalog/cart'),
          ),
        ],
      ),
      body: _widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar:  BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_outlined),
            label: 'Каталог',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.remove_red_eye_outlined),
            label: 'Просмотренное',
          )
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  final Item item;

  const AddButton({required this.item});

  @override
  Widget build(BuildContext context) {
    var isInCart = context.select<CartModel, bool>(
          (cart) => cart.items.contains(item),
    );

    return TextButton(
      onPressed: isInCart
          ? null
          : () {
        var cart = context.read<CartModel>();
        cart.add(item);
      },
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed)) {
            return Theme.of(context).primaryColor;
          }
          return null;
        }),
      ),
      child: isInCart
          ? const Icon(Icons.check, semanticLabel: 'ADDED')
          : const Text('ADD'),
    );
  }
}

class _MyListItem extends StatelessWidget {
  final int index;

  const _MyListItem(this.index);

  @override
  Widget build(BuildContext context) {
    var item = context.select<CatalogModel, Item>(
          (catalog) => catalog.getByPosition(index),
    );
    var textTheme = Theme.of(context).textTheme.titleLarge;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: item.color,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: TextButton(
                onPressed: () {
                  productScreen = item;
                  context.go('/catalog/product');
                  productViewed[item.id] = productScreen;
                },
                child: Text('${item.name} - ${item.price}р.', style: textTheme),
              ),
            ),
            const SizedBox(width: 24),
            AddButton(item: item),
          ],
        ),
      ),
    );
  }
}

class _MyListItemView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme.titleLarge;
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: productViewed.values.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Row(
            children: [
              SizedBox(
                height: 30,
                width: 30,
                child: Container(
                  color: productViewed.values.elementAt(index).color,
                ),
              ),
              const SizedBox(width: 24, height: 30,),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    productScreen = productViewed.values.elementAt(index);
                    context.go('/catalog/product');
                  },
                  child: Text('${productViewed.values.elementAt(index).name} - ${productViewed.values.elementAt(index).price}р.', style: textTheme),
                ),
              ),
              const SizedBox(width: 24, height: 30,),
              AddButton(item: productViewed.values.elementAt(index)),
            ],
          )
        );},
    );
  }
}