import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  final String Img;
  const CategoriesWidget({super.key, required this.Img});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),

        ),
        child: Column(
          children: [
            Image.asset(Img),],
        ),),
    );
  }
}
