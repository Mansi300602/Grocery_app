
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/checkout.dart';
import 'package:myproject/checkout_1.dart';
import 'package:myproject/widgets/bottom_nevigation_widget.dart';
import 'package:myproject/widgets/item_details_widget.dart';

class ItemsDetails extends StatefulWidget {
  const ItemsDetails({super.key});

  @override
  State<ItemsDetails> createState() => _ItemsDetailsState();
}

class _ItemsDetailsState extends State<ItemsDetails> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Map<String, String>> items = [
    {'image': 'assets/images/banana.png', 'title': 'FRUITS', 'des': 'Banana', 'price': r"$7.8"},
    {'image': 'assets/images/banana.png', 'title': 'DAIRY', 'des': 'MILK', 'price': r"$20"},
    {'image': 'assets/images/banana.png', 'title': 'VEGETABLE', 'des': 'Lady Finger', 'price': r"$45"},
    {'image': 'assets/images/banana.png', 'title': 'Bakery', 'des': 'Bread', 'price': r"$25"},
    {'image': 'assets/images/banana.png', 'title': 'VEGETABLE', 'des': 'Potato', 'price': r"$45"},
  ];

  void _deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? Colors.black : Color(0xFFF2F2F2);
    final textColor = isDarkMode ? Colors.white : Colors.black;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(

        title: Text(
          "Item details",
          style: TextStyle(
            color: textColor,
            fontSize: 20,),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Center(
              child: GestureDetector(
               onTap: () {
                 Get.to(Checkout1());
               },
                child: Text(
                  "Place Order",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(items.length, (index) {
            final item = items[index];
            return ItemDetailsWidget(
              image: item['image']!,
              title: item['title']!,
              des: item['des']!,
              price: item['price']!,
              itemKey: ValueKey(item['title']), // Unique key for dismissible
              onDismissed: () => _deleteItem(index), // Pass the delete callback
            );
          }),
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
