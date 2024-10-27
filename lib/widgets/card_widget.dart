import 'package:flutter/material.dart';
class CardWidget extends StatelessWidget {
  final String cardnumber;
  final String expirynumber;
  final String firstname;
  final String lastname;
  final Color? backgroundColor;


  const CardWidget({
    Key? key,
    required this.cardnumber,
    required this.expirynumber,
    required this.firstname,
    required this.lastname,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 30, ),
      color: Colors.black, // Added elevation
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Colors.pink), // Added pink border
      ), // Change the background color of the card
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0,top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to start
          children: [
            Text(
              "CREDIT CARD",
              style: TextStyle(color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 2.3,),
            ),
            SizedBox(height: 5), // Added space between title and icon
            Icon(
              Icons.credit_card, // Replace with any icon you want
              size: 20, // Size of the icon
              color: Colors.blue,
            ),
            SizedBox(height: 4), // Added space between icon and card number
            Text(
              cardnumber as String, // User provided text
              style: TextStyle(
                fontSize: 18,
                letterSpacing: 1.1,
                color: Colors.green[600],
              ),
            ),
             // Added space for better layout
            Text(
              "4532", // Another constant text, or you can replace this
              style: TextStyle(color: Colors.white,
                  fontSize: 6,
                  fontWeight: FontWeight.w400),
            ),
        // Added space before the row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "VALID", // This seems to be another value, consider what this should be
                      style: TextStyle(color: Colors.white, fontSize: 5),
                    ),
                    Text(
                      "THRU", // This seems to be another value, consider what this should be
                      style: TextStyle(color: Colors.white, fontSize: 5),
                    ),
                  ],
                ),

                SizedBox(width: 4),
                Text(
                    expirynumber as String, // User provided text
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.yellow[600],
                  ),
                ),
              ],

            ),
            SizedBox(height: 9),
            Row(
              children: [
                Text(
                  firstname as String, // User provided text
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.blue,
                    letterSpacing: 1.8,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  lastname as String, // User provided text
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.blue,
                    letterSpacing: 1.8,
                  ),
                ),
                SizedBox(width: 80),
                (Icon(Icons.check_circle,size: 24,color: Colors.yellow,))
              ],

            ),
          ],
        ),
      ),
    );
  }
}
