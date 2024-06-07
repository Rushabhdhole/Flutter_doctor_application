import 'package:flutter/material.dart';

class PaymentDetails extends StatefulWidget {
  @override
  _PaymentDetailsState createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          // Left side illustration
          Expanded(
            child: Container(
              color: Color(0xFFE3E8F9),
              child: Center(
                child: Image.asset(
                  'assets/doc2.png', // Path to the illustration image
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          // Right side content
          Expanded(
            child: Container(
              padding: EdgeInsets.all(40.0),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SAPDOS',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF13235A),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Booking Appointment',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF13235A),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Payment Method',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Card',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Enter your details below',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Card Number',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Card Holder',
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'MM/YY',
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'CVV',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        _showBookingConfirmedDialog(context);
                      },
                      child: Text('Pay now'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF13235A),
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        textStyle: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showBookingConfirmedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            height: 250,
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle, size: 50, color: Color(0xFF13235A)),
                SizedBox(height: 20),
                Text(
                  'Your booking is confirmed',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF13235A),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('Okay'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF13235A),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
