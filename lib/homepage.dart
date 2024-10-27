import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/categories.dart';
import 'package:myproject/fruits_category.dart';
import 'package:myproject/widgets/bottom_nevigation_widget.dart';
import 'package:myproject/widgets/custom-button-widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isDarkMode = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Determine text color based on the current mode
    final Color textColor = isDarkMode ? Colors.white : Colors.black;

    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: Container(
              margin: EdgeInsets.fromLTRB(0, 90, 10, 50),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good Morning',
                    style: TextStyle(fontSize: 15, color: textColor.withOpacity(0.7)),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                padding: EdgeInsets.only(top: 32, right: 20),
                icon: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
                onPressed: () {
                  setState(() {
                    isDarkMode = !isDarkMode;
                    Get.changeTheme(isDarkMode ? ThemeData.dark() : ThemeData.light());
                  });
                },
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Mansi Gupta',
                        style: TextStyle(
                          fontSize: 22,
                          color: textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.notifications, color: textColor),
                        onPressed: () {
                          print("Notification button pressed!");
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildRecommendedCard('Recommended Recipe Today', 'assets/images/img_3.png'),
                        _buildRecommendedCard('Fresh Fruits Delivery', 'assets/images/img_2.png'),
                        _buildRecommendedCard('Healthy Smoothies', 'assets/images/img_3.png'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildSectionHeader('Categories'),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildCategoryCard('Vegetables', 'assets/images/img_5.png'),
                        _buildCategoryCard('Fruits', 'assets/images/img_5.png'),
                        _buildCategoryCard('Dairy', 'assets/images/img_5.png'),
                        _buildCategoryCard('Bakery', 'assets/images/img_5.png'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildSectionHeader('Trending Deals'),
                  GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 10,
                    children: [
                      _buildTrendingDealCard('Organic Apples', 'assets/images/ab.jpg'),
                      _buildTrendingDealCard('Fresh Milk', 'assets/images/ewjk.jpg'),
                      _buildTrendingDealCard('Whole Grain Bread', 'assets/images/sdfjj.jpg'),
                      _buildTrendingDealCard('Farm Eggs', 'assets/images/ab.jpg'),
                      _buildTrendingDealCard('Whole Grain Bread', 'assets/images/sdfjj.jpg'),
                      _buildTrendingDealCard('Farm Eggs', 'assets/images/ab.jpg'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: CustomButton(
                      text: 'More',
                      onPressed: () {
                        Get.to(FruitsCategory());
                      },
                      mode: ButtonMode.dark,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationWidget(),
      ),
    );
  }

  Widget _buildRecommendedCard(String text, String imagePath) {
    return Container(
      margin: const EdgeInsets.only(right: 20.0),
      height: 150,
      width: 300,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: 300,
              height: 150,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String category, String imagePath) {
    return GestureDetector(
      onTap: () {
        Get.to(Categories());
      },
      child: Container(
        margin: const EdgeInsets.only(right: 14.0),
        height: 80,
        width: 90,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: 80,
                width: 90,
              ),
            ),
            Container(
              height: 80,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black.withOpacity(0.3),
              ),
            ),
            Center(
              child: Text(
                category,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrendingDealCard(String dealName, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => FruitsCategory(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 15.0, top: 5, bottom: 10.0, right: 5.0),
        height: 175,
        width: 140,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: 175,
                width: 140,
              ),
            ),
            Positioned(
              top: 3,
              left: 0,
              child: Container(
                child: IconButton(
                  icon: Icon(Icons.favorite, color: Colors.red),
                  onPressed: () {
                    print("Notification button pressed!");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    final Color textColor = isDarkMode ? Colors.white : Colors.black;
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 22,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        IconButton(
          icon: Icon(Icons.arrow_forward, color: textColor),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Categories()),
            );
          },
        ),
      ],
    );
  }
}