import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/items_details.dart';
import 'package:myproject/thankyou.dart';
import 'package:myproject/widgets/card_widget.dart';
import 'package:myproject/widgets/custom-button-widget.dart';
import 'package:myproject/widgets/textfield_widget.dart';

class welcome extends StatefulWidget {
  const welcome({super.key});

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  RangeValues values = RangeValues(1, 50);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? Colors.black : Color(0xFFF2F2F2);
    final textColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          title: Text(
            'Checkout',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.titleLarge?.color,
            ),
            textAlign: TextAlign.center,
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            RangeSlider(
              min: 1,
              max: 100,
              values: values,
              onChanged: (value) {
                setState(() {
                  values = value;
                });
              },
            ),

            Container(
              margin: EdgeInsets.only(top: 120),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height: 141,
                      width: 260,
                      child: CardWidget(
                        cardnumber: '1234 3155 4039 2068',
                        expirynumber: '01/19',
                        firstname: 'Mansi',
                        lastname: 'Gupta',
                      ),
                    ),
                    Container(
                      height: 141,
                      width: 260,
                      child: CardWidget(
                        cardnumber: '1234 3155 4039 2068',
                        expirynumber: '01/19',
                        firstname: 'Mansi',
                        lastname: 'Gupta',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            CustomField(
              labelText: 'Card Holder Name',
              fieldType: FieldType.disabled,
              controller: TextEditingController(text: 'Mansi Gupta'),
            ),
            SizedBox(height: 20),
            CustomField(
              labelText: 'Card Number',
              fieldType: FieldType.disabled,
              controller: TextEditingController(text: '333 4444 5555 6666'),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                CustomField(
                  labelText: 'Month/Year',
                  hintText: 'Enter here',
                  fieldType: FieldType.small,
                ),
                CustomField(
                  labelText: 'CVV',
                  hintText: 'Enter here',
                  fieldType: FieldType.small,
                  width: 150,
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: CustomField(
                labelText: 'Country',
                hintText: 'Choose your country',
                fieldType: FieldType.regular,
              ),
            ),
            SizedBox(height: 56),
            Container(
              margin: const EdgeInsets.only(bottom: 50),
              child: CustomButton(
                text: 'CONFIRM ORDER',
                onPressed: () {
                  Get.to(thankyou());
                },
                mode: ButtonMode.main,
              ),
            ),
          ],
        ),
      ),
    );
  }
}