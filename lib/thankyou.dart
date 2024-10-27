import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/homepage.dart';
import 'package:myproject/widgets/custom-button-widget.dart';

class thankyou extends StatelessWidget {
  const thankyou({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? Colors.black : Color(0xFFF2F2F2);
    final textColor = isDarkMode ? Colors.white : Colors.black;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          title: Text('Thank You',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold,),
              textAlign: TextAlign.center),

          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.deepOrangeAccent,
              ),
              child: IconButton(
                icon: Icon(Icons.close),
                color: Colors.black, // Icon color
                onPressed: () {
                Get.to(Homepage());
                },
              ),
            ),
          ),
          ),
        ),
      body: Column(
          children: [
      Expanded(
      child: PageView.builder(
      itemCount: 3 ,
          itemBuilder: (_,i){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  Image.asset("assets/images/img_1.png", height: 280,),
                  SizedBox(height: 90),
                  Text("Your Order in process",
                      style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold)
                  ),
                  SizedBox(height: 25),

                  Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, ""sed do eiusmod tempor ",
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300,),
                    textAlign: TextAlign.center,
                  )

                ],
              ),
            );
          }),
    ),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child: CustomButton(
                text: 'TRACK YOUR ORDER',
                onPressed: () {},
                mode: ButtonMode.main,
              ),
            ),
          ],

    ),

    );
  }
}