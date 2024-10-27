import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/congrats.dart';
import 'package:myproject/onboarding .dart';
import 'package:myproject/signin_page.dart';
import 'package:myproject/widgets/custom-button-widget.dart';
import 'package:myproject/widgets/email_pass_textfield_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homepage.dart';
class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}
class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  bool _obscureText = true;

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Save user credentials
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', _emailController.text);
      await prefs.setString('password', _passwordController.text);
      await prefs.setString('firstName', _firstNameController.text);
      await prefs.setString('lastName', _lastNameController.text);

      // Navigate to HomePage
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => const CongratulationsScreen()),
      // );
      Get.to(CongratulationsScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Get.to(Onboarding());
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Onboarding()),
              // );
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),

      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage("assets/images/img_6.png"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.9),
                  BlendMode.dstATop,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(left: 15,right: 15),
              height: 480,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Create your account',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              // Handle close button press
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _firstNameController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10.0),

                                hintText: 'First name',

                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Color(0XFFE67F1E))
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Color(0XFFE67F1E)),
                                ),


                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: TextFormField(
                              controller: _lastNameController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10.0),

                                hintText: 'Last Name',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(color: Color(0XFFE67F1E))

                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Color(0XFFE67F1E)),
                                ),

                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      EmailField(
                        controller: _emailController,
                        validate: true,
                        bordercolor: Color(0XFFE67F1E),// Enable validation
                      ),
                      SizedBox(height: 20),
                      PasswordField(
                        controller: _passwordController,
                        validate: true, // Enable validation
                        obscureText: _obscureText,
                        bordercolor: Color(0XFFE67F1E),
                        onToggleVisibility: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left:13.0,right: 13),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(text: 'By tapping Sign up you accept all '),
                              TextSpan(
                                text: 'terms',
                                style: TextStyle(color: Colors.orange),
                              ),
                              TextSpan(text: ' and '),
                              TextSpan(
                                text: 'condition',
                                style: TextStyle(color: Colors.orange,),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.only(top: 5, left: 28),
                        child: CustomButton(
                          text: 'CREATE AN ACCOUNT',
                          onPressed: _submitForm,
                          mode: ButtonMode.main,
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
    );
  }
}
