import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/fruits_category.dart';
import 'package:myproject/items_details.dart';
import 'package:myproject/widgets/bottom_nevigation_widget.dart';
import 'package:myproject/widgets/custom-button-widget.dart';
import 'quantity_controller.dart';

class Review extends StatefulWidget {
  const Review({super.key});

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  final QuantityController quantityController = Get.put(QuantityController());
  int _selectedIndex = 0;
  final double basePrice = 23.0;

  @override
  Widget build(BuildContext context) {
    // Get the current theme
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final backgroundColor = isDarkMode ? Colors.black : Colors.white;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
            icon: Icon(
              Icons.share,
              color: Colors.white,
              size: 25,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage("assets/images/img_7.png"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.9),
                  BlendMode.dstATop,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 15, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "FRUITS",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: textColor),
                      ),
                      Text(
                        "Fresh Orange",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 23, color: textColor),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Obx(() => Text(
                            "\$ ${(basePrice * quantityController.quantity.value).toStringAsFixed(2)}",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                              color: Colors.orangeAccent,
                            ),
                          )),
                          SizedBox(width: 135),
                          IconButton(
                            padding: EdgeInsets.only(top: 5, right: 17),
                            icon: Icon(Icons.remove, color: Colors.orangeAccent),
                            onPressed: quantityController.decrement,
                          ),
                          Obx(() => Text(
                            '${quantityController.quantity}',
                            style: TextStyle(fontSize: 22.0, color: textColor),
                          )),
                          IconButton(
                            padding: EdgeInsets.only(top: 5, left: 17),
                            icon: Icon(Icons.add, color: Colors.orangeAccent),
                            onPressed: quantityController.increment,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            padding: const EdgeInsets.only(right: 25),
                            icon: Icon(Icons.star, color: Colors.orangeAccent),
                            onPressed: () {},
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Text(
                              '4.5',
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                          Text(
                            '(128 reviews)',
                            style: TextStyle(fontSize: 13.0, color: Colors.grey),
                          ),
                          SizedBox(width: 106),
                          IconButton(
                            icon: Icon(Icons.person_2_rounded, color: Colors.black, size: 30),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            'Description',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(width: 30),
                          Text(
                            'Review',
                            style: TextStyle(fontSize: 18.0, color: Colors.grey),
                          ),
                          SizedBox(width: 30),
                          Text(
                            'Discussion',
                            style: TextStyle(fontSize: 18.0, color: Colors.grey),
                          ),
                        ],
                      ),
                      Divider(color: Colors.orangeAccent),
                      SizedBox(height: 15),
                      Text(
                        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
                            " when an unknown printer took a galley of type and scrambled it to make a type "
                            "specimen book. It has survived not only five centuries, but also the leap into "
                            "electronic typesetting, remaining essentially unchanged.",
                        style: TextStyle(fontSize: 14),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 35),
                        child: Row(
                          children: [
                            CustomButton(
                              text: '', // Text is not used for icon buttons, but the parameter is required
                              onPressed: () {},
                              mode: ButtonMode.icon,
                              icon: Icons.favorite, // Replace with your desired icon
                              backgroundColor: const Color(0xFF12B76A), // Optional: specify a background color
                            ),
                            const SizedBox(width: 20),
                        Obx(() => AddToCartButton(
                              mainText: 'ADD TO CART',
                              priceText: Text(
                                "\$ ${(basePrice * quantityController.quantity.value).toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black, // Add color if needed
                                ),
                                ),

                                onPressed: () {
                                Get.to(ItemsDetails());
                              },
                            ),
                        ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
