import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/fruits_category.dart';
import 'package:myproject/homepage.dart';
import 'package:myproject/widgets/bottom_nevigation_widget.dart';
import 'package:myproject/widgets/categories_widget.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? Colors.black : Color(0xFFF2F2F2);
    final textColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: backgroundColor,
          title: Text(
            "Categories",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: textColor,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: textColor,
              size: 32,
            ),
          ),
          centerTitle: true,
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
      body: Container(
        child: GestureDetector(
          onTap: () {
            Get.to(FruitsCategory());
          },
          child: GridView(
            padding: const EdgeInsets.all(30.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
            ),
            children: [
              CategoriesWidget(Img: "assets/images/fruit.png"),
              CategoriesWidget(Img: "assets/images/fruit.png"),
              CategoriesWidget(Img: "assets/images/fruit.png"),
              CategoriesWidget(Img: "assets/images/fruit.png"),
              CategoriesWidget(Img: "assets/images/fruit.png"),
              CategoriesWidget(Img: "assets/images/fruit.png"),
              CategoriesWidget(Img: "assets/images/fruit.png"),
              CategoriesWidget(Img: "assets/images/fruit.png"),
            ],
          ),
        ),
      ),
    );
  }
}