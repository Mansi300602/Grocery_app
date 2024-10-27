import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";

enum ButtonMode { main, dark, bordered, icon, price}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonMode mode;
  final IconData? icon;
  final Color? backgroundColor;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.mode = ButtonMode.main,
    this.icon,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (mode == ButtonMode.icon) {
      return IconCustomButton(
        icon: icon!,
        onPressed: onPressed,
        backgroundColor: backgroundColor,
      );
    }

    return Container(
      width: 318,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: _getBackgroundColor(),
        border: mode == ButtonMode.bordered
            ? Border.all(color: Colors.black, width: 2)
            : null,
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1.5,
            color: _getTextColor(),
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (mode) {
      case ButtonMode.main:
        return const Color(0xFFFEC54B);
      case ButtonMode.dark:
        return Colors.black;
      case ButtonMode.bordered:
      case ButtonMode.icon:
        return Colors.white;
      case ButtonMode.price:
        return const Color(0xFFFEC54B);
    }
  }

  Color _getTextColor() {
    switch (mode) {
      case ButtonMode.main:
      case ButtonMode.bordered:
      case ButtonMode.icon:
        return Colors.black;
      case ButtonMode.dark:
        return Colors.white;
      case ButtonMode.price:
        return Colors.black;
    }
  }
}

class IconCustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color? backgroundColor;

  const IconCustomButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 93,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: backgroundColor ?? Colors.white,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }
}
  class AddToCartButton extends StatelessWidget {
  final String mainText;
  final Widget priceText;
  final VoidCallback onPressed;

  const AddToCartButton({
  Key? key,
  required this.mainText,
  required this.priceText,
  required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Container(
    width: 206,
    height: 60,
    child: ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFFFEC54B), // Yellow background
    foregroundColor: Colors.black,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30), // Rounded corners
    ),
    // padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    ),
    child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
    Text(
    mainText,
    style: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    ),
    ),
      priceText,
    //   style: const TextStyle(
    // fontSize: 14,
    // fontWeight: FontWeight.bold,
    // ),
    ],
    ),
    ),
  );
  }
  
  }
class ImageWithPriceOverlay extends StatelessWidget {
  final String imagePath;
  final String price;
  final VoidCallback onPressed;

  const ImageWithPriceOverlay({
    Key? key,
    required this.imagePath,
    required this.price,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 14, bottom: 14),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imagePath,
              height: 113,
              width: 93,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: Center(
              child: PriceCustomButton(
                priceText: 'price',
                backgroundColor: Colors.white.withOpacity(0.8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PriceCustomButton extends StatelessWidget {
  final String priceText;
  final Color? backgroundColor;

  const PriceCustomButton({
    Key? key,
    required this.priceText,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 93,
        minHeight: 40,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: backgroundColor ?? Color(0xFFFEC54B),
      ),
      child: Center(
        child: Text(
          priceText,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
