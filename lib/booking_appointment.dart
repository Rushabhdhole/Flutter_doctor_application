import 'package:flutter/material.dart';
import 'payment_details.dart'; // Import the PaymentDetails page

class BookingAppointment extends StatefulWidget {
  final String timeSlot;

  BookingAppointment({required this.timeSlot});

  @override
  _BookingAppointmentState createState() => _BookingAppointmentState();
}

class _BookingAppointmentState extends State<BookingAppointment> {
  String? _selectedPaymentMethod;

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
                    'Selected Time Slot',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.timeSlot,
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 40),
                  Text(
                    'Payment Method',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    value: _selectedPaymentMethod,
                    items: [
                      DropdownMenuItem(
                        child: Text('Net Banking'),
                        value: 'Net Banking',
                      ),
                      DropdownMenuItem(
                        child: Text('Card'),
                        value: 'Card',
                      ),
                      DropdownMenuItem(
                        child: Text('UPI'),
                        value: 'UPI',
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedPaymentMethod = value;
                      });

                      if (value == 'Card') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentDetails()),
                        );
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    ),
                    icon: Icon(Icons.arrow_drop_down),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
