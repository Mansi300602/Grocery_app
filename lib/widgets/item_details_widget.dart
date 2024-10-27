
import 'package:flutter/material.dart';

import 'custom-button-widget.dart';

class ItemDetailsWidget extends StatefulWidget {
  final String image;
  final String title;
  final String des;
  final String price;
  final Key itemKey; // Added key for Dismissible
  final Function() onDismissed; // Callback for when the item is dismissed

  const ItemDetailsWidget({
    super.key,
    required this.image,
    required this.title,
    required this.des,
    required this.price,
    required this.itemKey,
    required this.onDismissed,
  });

  @override
  _ItemDetailsWidgetState createState() => _ItemDetailsWidgetState();
}

class _ItemDetailsWidgetState extends State<ItemDetailsWidget> {
  int _quantity = 1; // Initialize quantity

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? Colors.black : Color(0xFFF2F2F2);
    final textColor = isDarkMode ? Colors.white : Colors.black;
    return Dismissible(
      key: widget.itemKey, // Use the key provided
      background: Container(
        color: Colors.black, // Background color when dismissing
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Image.asset(
          'assets/images/icon_2.png',
          width: 30,
          height: 30,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {

        widget.onDismissed();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${widget.title} removed from cart')),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(0),
        height: 160,
        child: Card(
          // elevation: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Container(
                    height: 113,
                    width: 93,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [Image.asset(
                        width: 93,
                        height: 113,
                        widget.image,
                        fit: BoxFit.cover,
                      ),
                         Positioned(

                           left: 0,
                           right: 0,
                           child: Container(
                              // padding: EdgeInsets.only(top: 10,),
                             child: PriceCustomButton(
                               priceText: '\$ 7.00',
                             ),
                           ),
                         ),
                    ],
                    ),

                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 13),
                      child: Text(
                        widget.title,
                        style: TextStyle(color: Colors.grey, fontSize: 12,fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13),
                      child: Text(
                        widget.des,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13, top: 40),
                      child: Text(
                        '\$${(double.parse(widget.price.substring(1)) * _quantity).toStringAsFixed(2)}', // Update price based on quantity
                        style: TextStyle(color: Colors.orange, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15, top: 75),
                child: Container(
                  height:35 ,
                  width: 113,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,  // Horizontally centers the content
                    crossAxisAlignment: CrossAxisAlignment.center, // Vertically centers the icons and text
                    children: [
                      IconButton(
                        iconSize: 20.0,
                        icon: Icon(Icons.remove, color: Colors.grey,),
                        onPressed: _decrementQuantity,
                      ),
                      Text(
                        '$_quantity', // Display current quantity
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0),
                      ),
                      IconButton(
                        iconSize: 20.0,
                        icon: Icon(Icons.add, color: Colors.grey,),
                        onPressed: _incrementQuantity,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:myproject/quantity_controller.dart'; // Import the controller
// import 'custom-button-widget.dart';
//
// class ItemDetailsWidget extends StatefulWidget {
//   final String image;
//   final String title;
//   final String des;
//   final String price;
//   final Key itemKey; // Added key for Dismissible
//   final Function() onDismissed; // Callback for when the item is dismissed
//
//   const ItemDetailsWidget({
//     super.key,
//     required this.image,
//     required this.title,
//     required this.des,
//     required this.price,
//     required this.itemKey,
//     required this.onDismissed,
//   });
//
//   @override
//   _ItemDetailsWidgetState createState() => _ItemDetailsWidgetState();
// }
//
// class _ItemDetailsWidgetState extends State<ItemDetailsWidget> {
//   final QuantityController quantityController = Get.put(QuantityController()); // Initialize the controller
//
//   @override
//   Widget build(BuildContext context) {
//     return Dismissible(
//       key: widget.itemKey, // Use the key provided
//       background: Container(
//         color: Colors.black, // Background color when dismissing
//         alignment: Alignment.centerRight,
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         child: Image.asset(
//           'assets/images/icon_2.png',
//           width: 30,
//           height: 30,
//         ),
//       ),
//       direction: DismissDirection.endToStart,
//       onDismissed: (direction) {
//         widget.onDismissed();
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('${widget.title} removed from cart')),
//         );
//       },
//       child: Container(
//         padding: const EdgeInsets.all(0),
//         height: 160,
//         child: Card(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 20),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(18),
//                   child: Container(
//                     height: 113,
//                     width: 93,
//                     child: Stack(
//                       alignment: Alignment.bottomCenter,
//                       children: [
//                         Image.asset(
//                           width: 93,
//                           height: 113,
//                           widget.image,
//                           fit: BoxFit.cover,
//                         ),
//                         Positioned(
//                           left: 0,
//                           right: 0,
//                           child: Container(
//                             child: PriceCustomButton(
//                               priceText: ' ${widget.price}',
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 20, left: 13),
//                       child: Text(
//                         widget.title,
//                         style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 13),
//                       child: Text(
//                         widget.des,
//                         style: TextStyle(color: Colors.black, fontSize: 16),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 13, top: 40),
//                       child: Obx(() => Text(
//                         '\$${(double.parse(widget.price.substring(1)) * quantityController.quantity.value).toStringAsFixed(2)}', // Update price based on quantity
//                         style: TextStyle(color: Colors.orange, fontSize: 18),
//                       )),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 30, top: 75),
//                 child: Container(
//                   height: 35,
//                   width: 110,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[300],
//                     borderRadius: BorderRadius.circular(40.0),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center, // Horizontally centers the content
//                     crossAxisAlignment: CrossAxisAlignment.center, // Vertically centers the icons and text
//                     children: [
//                       IconButton(
//                         iconSize: 20.0,
//                         icon: Icon(Icons.remove, color: Colors.grey),
//                         onPressed: quantityController.decrement,
//                       ),
//                       Obx(() => Text(
//                         '${quantityController.quantity}', // Display current quantity
//                         style: TextStyle(fontSize: 18.0),
//                       )),
//                       IconButton(
//                         iconSize: 20.0,
//                         icon: Icon(Icons.add, color: Colors.grey),
//                         onPressed: quantityController.increment,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
