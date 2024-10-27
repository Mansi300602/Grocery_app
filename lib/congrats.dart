import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/signin_page.dart';
import 'package:myproject/widgets/custom-button-widget.dart';
import 'dart:ui';

class CongratulationsScreen extends StatelessWidget {
  const CongratulationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Image.asset(
            "assets/images/signup.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Blurred overlay
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.5),
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          // Congratulations card
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: 300,
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Congratulations!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFE67F1E),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Your account has been created successfully.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 30),
                    CustomButton(
                      text: 'SIGN IN',
                      onPressed: () {
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => const SigninPage()),
                        // );
                        Get.to(SigninPage());
                      },
                      mode: ButtonMode.main,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}