import 'package:flutter/material.dart';
import 'package:myproject/Signup.dart';  // Update this according to your actual file imports
import 'package:myproject/homepage.dart';
import 'package:myproject/signin_page.dart';  // Update this according to your actual file imports
import 'package:google_fonts/google_fonts.dart';
import 'package:myproject/widgets/custom-button-widget.dart';  // Custom Button widget

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final List<Map<String, String>> contents = [
    {
      "title": "Welcome to Fresh Fruits",
      "subtitle": "Grocery application",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
      "image": "assets/images/img.png",
    },
    {
      "title": "We Provide Best Quality Fruits to Your Family",
      "description": "Find the best fruits and vegetables to maintain a healthy lifestyle.",
      "image": "assets/images/img.png",
    },

    {
      "title": "Fast and responsibly delivery by our courier",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.",
      "image": "assets/images/img_1.png",
    },
  ];

  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _onPageChanged(_pageController.page!.round());
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: contents.length,
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.only(top: 100.0,left: 24,right: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(contents[i]["image"]!),
                      const SizedBox(height: 20),
                      Text(
                        contents[i]["title"]!,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          height: 26.14 / 24,
                        ),
                      ),
                      const SizedBox(height: 15),
                      if (i == 0)
                        Text(
                          contents[i]["subtitle"]!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            height: 24.3 / 24,
                          ),
                        ),
                      const SizedBox(height: 5),
                      Container(
                        width: 318,
                        height: 44,
                        padding: const EdgeInsets.only(left: 28.0, right: 28, top: 10),
                        child: Text(
                          contents[i]["description"]!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              onPageChanged: _onPageChanged,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(contents.length, (index) {
                return Container(
                  height: 8,
                  width: 22,
                  margin: const EdgeInsets.only(right: 5,top: 20),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    shape: BoxShape.rectangle,
                    color: _currentPage == index ? const Color(0xFF12B76A) : Colors.grey,
                  ),
                );
              }),
            ),
          ),
          if (_currentPage < contents.length - 1)
            Container(
              margin: const EdgeInsets.only(bottom:40,),
              child: CustomButton(
                text: 'NEXT',
                onPressed: () {
                  if (_currentPage < contents.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                mode: ButtonMode.main,
              ),
            )
          else
            Container(
              margin: const EdgeInsets.only(bottom:20, left: 28),
              child: Column(
                children: [
                  CustomButton(
                    text: 'CREATE AN ACCOUNT',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Signup()),  // Change 'Homepage' to your actual destination page
                      );
                    },
                    mode: ButtonMode.dark,
                  ),
                  SizedBox(height: 19,),
                CustomButton(
                  text: 'LOGIN',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SigninPage()),  // Change 'Homepage' to your actual destination page
                    );
                  },
                  mode: ButtonMode.bordered,
                ),
                ],
              ),

            ),
        ],
      ),
    );
  }
}
