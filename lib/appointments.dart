import 'package:flutter/material.dart';
import 'appointment_details.dart';
import 'screen_01.dart';

class Appointments extends StatelessWidget {
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
                  onTap: () {},
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
                                'assets/doctor.png'), // User image asset path
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
                                'Satish',
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
                  // Doctor's List
                  Text(
                    "Doctor's List",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AppointmentDetails(),
                              ),
                            );
                          },
                          child: _buildDoctorCard(),
                        );
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

  Widget _buildDoctorCard() {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  AssetImage('assets/doctor.png'), // Doctor image asset path
              radius: 30,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Doctor's name",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Doctor's specialization",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 14),
                    Icon(Icons.star, color: Colors.yellow, size: 14),
                    Icon(Icons.star, color: Colors.yellow, size: 14),
                    Icon(Icons.star, color: Colors.yellow, size: 14),
                    Icon(Icons.star_border, color: Colors.yellow, size: 14),
                    SizedBox(width: 5),
                    Text('512', style: TextStyle(color: Colors.black54)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
