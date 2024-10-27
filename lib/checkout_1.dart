import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/checkout.dart';
import 'package:myproject/thankyou.dart';
import 'package:myproject/widgets/card_widget.dart';
import 'package:myproject/widgets/custom-button-widget.dart';
import 'package:myproject/widgets/textfield_widget.dart';

class Checkout1 extends StatefulWidget {
  const Checkout1({super.key});

  @override
  State<Checkout1> createState() => _Checkout1State();
}

class _Checkout1State extends State<Checkout1> {
  RangeValues values = RangeValues(1, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
    child: AppBar(
    title: Text('Checkout',
    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold,),
    textAlign: TextAlign.center),
    leading: IconButton(
    onPressed: () {
    Get.back();
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => Onboarding()),
    // );
    },
      icon: Icon(
        Icons.arrow_back,
        color: Theme.of(context).iconTheme.color,
      ),),
    centerTitle: true, // Center the title
    ),
    ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.only(right: 18),
          child: Column(
            children: [
              RangeSlider(
                min: 1,
                max: 100,
                values: values,
                onChanged: (value) {
                  if (value.start <= value.end) {
                    setState(() {
                      values = value;
                    });
                  }
                },
              ),

              CustomField(
                labelText: 'Full Name',
                fieldType: FieldType.regular,
                controller: TextEditingController(text: 'Mansi Gupta'),
              ),
              SizedBox(height: 22),
              CustomField(
                labelText: 'Email Address',
                fieldType: FieldType.regular,
                controller: TextEditingController(text: 'rafatul3588@gmail.com'),
              ),
              SizedBox(height: 22),
              CustomField(
                labelText: 'Phone',
                hintText: '+880 1617202070',
                fieldType: FieldType.regular,
              ),
              SizedBox(height: 22),
              CustomField(
                labelText: 'Address',
                hintText: 'Type your home address',
                fieldType: FieldType.regular,
              ),
              SizedBox(height: 22),
              Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: Row(
                  children: [
                    CustomField(
                      labelText: 'Zip Code',
                      hintText: 'Enter here',
                      fieldType: FieldType.small,
                    ),
                    // Add space between fields
                    CustomField(
                      labelText: 'City',
                      hintText: 'Enter here',
                      fieldType: FieldType.small,
                      width: 150, // Adjust width as needed
                    ),
                  ],
                ),
              ),
              SizedBox(height: 22),
              CustomField(
                labelText: 'Country',
                hintText: 'Choose your country',
                fieldType: FieldType.regular,
              ),
              SizedBox(height: 56),
              Container(
                margin: const EdgeInsets.only(bottom: 50,left: 18 ),
                child: CustomButton(
                  text: 'CONFIRM ORDER',
                  onPressed: () {
                    Get.to(welcome());
                  },
                  mode: ButtonMode.main,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
