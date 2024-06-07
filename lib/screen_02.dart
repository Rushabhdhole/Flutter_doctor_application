import 'package:flutter/material.dart';
import 'dashboard.dart';

class Screen02 extends StatefulWidget {
  @override
  _Screen02State createState() => _Screen02State();
}

class _Screen02State extends State<Screen02> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      // Perform login action
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Dashboard()),
      );
    }
  }

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
                        'Welcome Back\nEnter existing account’s details below the SAPDOS',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 30),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Checkbox(
                                  value: _rememberMe,
                                  onChanged: (value) {
                                    setState(() {
                                      _rememberMe = value!;
                                    });
                                  },
                                ),
                                Text('Remember me'),
                                Spacer(),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Forgot password?',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color(0xFF13235A), // Button color
                                minimumSize:
                                    Size(double.infinity, 50), // Button size
                              ),
                              onPressed: _login,
                              child: Text('LOGIN'),
                            ),
                            SizedBox(height: 10),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Not on Sapdos? Sign-up',
                                style: TextStyle(color: Colors.black54),
                              ),
                            ),
                          ],
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
