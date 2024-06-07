// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

class PatientDetails extends StatelessWidget {
  final Color mainColor = const Color(0xFF13235A);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back button
            IconButton(
              icon: Icon(Icons.arrow_back, color: mainColor),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            // Patient Info
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/doc2.png'), // Patient image asset path
                  radius: 50,
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person, color: mainColor),
                        const SizedBox(width: 5),
                        const Text(
                          'Patient Name',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.cake, color: mainColor),
                        const SizedBox(width: 5),
                        const Text(
                          'Patient age',
                          style: TextStyle(fontSize: 18, color: Colors.black54),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Issue description',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: mainColor),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Patient History and Prescription
            Expanded(
              child: ListView(
                children: [
                  _buildExpansionTile('Patient History', Icons.history, [
                    _buildReportItem('Blood report'),
                    _buildReportItem('CT Scan report'),
                  ]),
                  _buildExpansionTile('Prescription', Icons.receipt, [
                    _buildPrescriptionItem('26 March 2022'),
                    _buildPrescriptionItem('13 April 2022'),
                    _buildAddNewPrescription(),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpansionTile(
      String title, IconData icon, List<Widget> children) {
    return ExpansionTile(
      leading: Icon(icon, color: mainColor),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: mainColor,
        ),
      ),
      children: children,
      collapsedBackgroundColor: mainColor.withOpacity(0.1),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 20),
    );
  }

  Widget _buildReportItem(String reportName) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFF13235A)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListTile(
        title: Text(
          reportName,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        trailing: const Icon(Icons.visibility, color: Color(0xFF13235A)),
        onTap: () {},
      ),
    );
  }

  Widget _buildPrescriptionItem(String date) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFF13235A)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListTile(
        title: Text(
          date,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        trailing: const Icon(Icons.visibility, color: Color(0xFF13235A)),
        onTap: () {},
      ),
    );
  }

  Widget _buildAddNewPrescription() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFF13235A)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListTile(
        title: const Text(
          'Add new',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF13235A)),
        ),
        trailing: const Icon(Icons.add, color: Color(0xFF13235A)),
        onTap: () {},
      ),
    );
  }
}
