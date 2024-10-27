import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/homepage.dart';
import 'package:myproject/review_page.dart';
import 'package:myproject/widgets/bottom_nevigation_widget.dart';

class FruitsCategory extends StatefulWidget {
  const FruitsCategory({super.key});

  @override
  State<FruitsCategory> createState() => _FruitsCategoryState();
}

class _FruitsCategoryState extends State<FruitsCategory> {
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            size: 35,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
            Get.to(Homepage());
            },
            icon: Image.asset(
              'assets/images/icon.png', // Update with your image path
              width: 45, // Set width as needed
              height: 45, // Set height as needed
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            color: Color(0xFFFEC54B), // Set the background color to orange
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 130, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Fruits Categories",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "87 items",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView( // Added SingleChildScrollView
              child: Column(
                children: [
                  SizedBox(height: 130), // Add some space
                  Container(
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Search bar
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Search here.',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.grey[200], // Background color of the search bar
                              suffixIcon: Icon(Icons.search),
                            ),
                          ),
                          SizedBox(height: 13), // Space between search bar and other widgets
                          // GridView
                          GridView.count(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(), // Disable scroll for GridView
                            crossAxisCount: 2,
                            childAspectRatio: 0.9,
                            mainAxisSpacing: 2,
                            crossAxisSpacing: 10,
                            children: [
                              _buildTrendingDealCard('Organic Apples', 'assets/images/img_3.png'),
                              _buildTrendingDealCard('Fresh Milk', 'assets/images/sdfjj.jpg'),
                              _buildTrendingDealCard('Whole Grain Bread', 'assets/images/ewjk.jpg'),
                              _buildTrendingDealCard('Farm Eggs', 'assets/images/ewjk.jpg'),
                              _buildTrendingDealCard('Whole Grain Bread', 'assets/images/ab.jpg'),
                              _buildTrendingDealCard('Farm Eggs', 'assets/images/sdfjj.jpg'),
                              _buildTrendingDealCard('Organic Apples', 'assets/images/ewjk.jpg'),
                              _buildTrendingDealCard('Fresh Milk', 'assets/images/img_3.png'),
                              _buildTrendingDealCard('Whole Grain Bread', 'assets/images/sdfjj.jpg'),
                              _buildTrendingDealCard('Organic Apples', 'assets/images/ab.jpg'),
                              _buildTrendingDealCard('Fresh Milk', 'assets/images/ab.jpg'),
                              _buildTrendingDealCard('Fresh Milk', 'assets/images/sdfjj.jpg'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
bottomNavigationBar: BottomNavigationWidget(),
    );
  }

  Widget _buildTrendingDealCard(String dealName, String imagePath) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(
        // MaterialPageRoute(
        //   builder: (context) => Review(),
        // ),
      // );
          Get.to(Review());
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
}
