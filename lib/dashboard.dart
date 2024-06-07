// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'patient_details.dart';
import 'screen_01.dart';
import 'appointments.dart'; // Import the appointments.dart file

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          // Left side menu
          Container(
            width: screenSize.width * 0.2,
            color: Color(0xFF13235A),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'SAPDOS',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.category, color: Colors.white),
                  title:
                      Text('Categories', style: TextStyle(color: Colors.white)),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.calendar_today, color: Colors.white),
                  title: Text('Appointment',
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Appointments()), // Navigate to the Appointments screen
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.chat, color: Colors.white),
                  title: Text('Chat', style: TextStyle(color: Colors.white)),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.settings, color: Colors.white),
                  title:
                      Text('Settings', style: TextStyle(color: Colors.white)),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.white),
                  title: Text('Logout', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Screen01()),
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
          // Right side content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                                'assets/doctor.png'), // Doctor image asset path
                            radius: 30,
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hello!',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Dr. Amol',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black54),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Icon(Icons.notifications,
                          size: 30, color: Colors.black54),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Today's Appointments
                  Text(
                    "Today's Appointments",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildAppointmentCard(
                          '19', 'Pending Appointments', Colors.blue),
                      _buildAppointmentCard(
                          '21', 'Completed Appointments', Colors.green),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Appointments List
                  Text(
                    'Wednesday, March 7',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF13235A)),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return _buildAppointmentItem(context, index);
                      },
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

  Widget _buildAppointmentCard(String count, String label, Color color) {
    return Container(
      width: 150,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            count,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: color),
          ),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(fontSize: 16, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentItem(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PatientDetails()),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // Clock icon
              Container(
                padding: EdgeInsets.all(10),
                color: Color(0xFFEBF0F6),
                child: Icon(Icons.access_time, color: Colors.blue),
              ),
              SizedBox(width: 10),
              // Time container
              Container(
                padding: EdgeInsets.all(10),
                color: Color(0xFFEBF0F6),
                child: Text(
                  '10:00 AM',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 10),
              // Patient details container
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Patient Name', style: TextStyle(fontSize: 16)),
                      Text('X years', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10),
              // Status icon
              Icon(Icons.check_circle, color: Colors.green),
            ],
          ),
        ),
      ),
    );
  }
}
