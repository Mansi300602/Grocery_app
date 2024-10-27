import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/homepage.dart';
import 'package:myproject/onboarding .dart';
import 'package:myproject/widgets/custom-button-widget.dart';
import 'package:myproject/widgets/email_pass_textfield_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});
  @override
  State<SigninPage> createState() => _SigninPageState();
}
class _SigninPageState extends State<SigninPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final prefs = await SharedPreferences.getInstance();
      final storedEmail = prefs.getString('email');
      final storedPassword = prefs.getString('password');

      if (_emailController.text == storedEmail && _passwordController.text == storedPassword) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  Homepage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid email or password')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(
              //     builder: (context) => const Onboarding()),);
              Get.to(Onboarding());
              },
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0XFFF2F2F2),
            )),),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset("assets/images/orange.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            children: [
              const Spacer(), // Pushes the container to the bottom
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),),),
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text( "Sign In",   style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(  width: 220,),
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {},),
                          ],
                        ),
                        const SizedBox(height: 20),
                        EmailField(
                          controller: _emailController,
                          validate: true,
                          bordercolor: Colors.grey, // Enable validation
                        ),
                        const SizedBox(height: 20),
                        PasswordField(
                          controller: _passwordController,
                          validate: true,
                          obscureText: _obscureText,
                          bordercolor: Colors.grey,
                          onToggleVisibility: () {
                            setState(() { _obscureText = !_obscureText; });
                          },
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: TextButton(
                            onPressed: () {  },
                            child: const Text("Forgot Password?",
                              style: TextStyle(color: Color(0xFFE67F1E)),
                            ),),),
                        Container(
                          margin: const EdgeInsets.only(top: 5, left: 28),
                          child: CustomButton(
                            text: 'SIGN IN',
                            onPressed: _submitForm,
                            mode: ButtonMode.main,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
