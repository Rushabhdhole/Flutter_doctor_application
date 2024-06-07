import 'package:flutter/material.dart';
import 'screen_02.dart';
import 'screen_03.dart';

class Screen01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
          child: Row(
            children: [
              // Left side image
              Expanded(
                flex: 1,
                child: Container(
                  color: Color(0xFFEBF0F6), // Light background color
                  child: Center(
                    child: Image.asset(
                      'assets/doc2.png', // Add your image asset path here
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              // Right side form
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SAPDOS',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF13235A),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Login to your sapdos account or create one now.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF13235A), // Button color
                          minimumSize: Size(double.infinity, 50), // Button size
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Screen02()),
                          );
                        },
                        child: Text('LOGIN'),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Color(0xFF13235A),
                          backgroundColor: Colors.white,
                          minimumSize: Size(double.infinity, 50),
                          side: BorderSide(color: Color(0xFF13235A)),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Screen03()),
                          );
                        },
                        child: Text('SIGN-UP'),
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Proceed as a Guest',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
