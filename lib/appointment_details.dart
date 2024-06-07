import 'package:flutter/material.dart';
import 'booking_appointment.dart'; // Import the BookingAppointment class

class AppointmentDetails extends StatefulWidget {
  @override
  _AppointmentDetailsState createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails> {
  String? _selectedTimeSlot;

  final List<String> _timeSlots = [
    '10:00 - 10:15 AM',
    '10:15 - 10:30 AM',
    '10:30 - 10:45 AM',
    '10:45 - 11:00 AM',
    '11:00 - 11:15 AM',
    '11:15 - 11:30 AM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    'assets/doctor.png', // Doctor image asset path
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. Lorem Ipsum',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Dentist (D.M.)',
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                    Text(
                      'BDS, DDS',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow, size: 20),
                        Icon(Icons.star, color: Colors.yellow, size: 20),
                        Icon(Icons.star, color: Colors.yellow, size: 20),
                        Icon(Icons.star, color: Colors.yellow, size: 20),
                        Icon(Icons.star_border, color: Colors.yellow, size: 20),
                        SizedBox(width: 5),
                        Text('512', style: TextStyle(color: Colors.black54)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      '5 Years Experience',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 20),
            Text(
              'Available Slots',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: _timeSlots.map((timeSlot) {
                return ChoiceChip(
                  label: Text(timeSlot),
                  selected: _selectedTimeSlot == timeSlot,
                  onSelected: (selected) {
                    setState(() {
                      _selectedTimeSlot = selected ? timeSlot : null;
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _selectedTimeSlot == null
                    ? null
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookingAppointment(
                              timeSlot: _selectedTimeSlot!,
                            ),
                          ),
                        );
                      },
                child: Text('Book Appointment'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF13235A),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
