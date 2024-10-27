import 'package:flutter/material.dart';

class HomepageContainer1 extends StatelessWidget {
  final String image;
  final String textonimage;

  const HomepageContainer1({
    super.key,
    required this.image,
    required this.textonimage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 300,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 10, // Position the text 10 pixels from the bottom
            left: 10,   // Position the text 10 pixels from the left
            child: Container(
              color: Colors.black54, // Background color with transparency
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Text(
                textonimage, // Use the variable here
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
