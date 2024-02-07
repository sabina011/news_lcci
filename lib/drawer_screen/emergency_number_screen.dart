import 'package:flutter/material.dart';

class EmergencyNumberScreen extends StatelessWidget {
  final List<Map<String, String>> phoneNumbers = [
    {'description': 'Ambulance: ', 'number': '+1 123-456-7890'},
    {'description': 'Blood Bank: ', 'number': '+44 20 7946 0958'},
    {'description': 'Hospital: ', 'number': '+81 3-1234-5678'},
    {'description': 'Ambulance: ', 'number': '+1 123-456-7890'},
    {'description': 'Blood Bank: ', 'number': '+44 20 7946 0958'},
    {'description': 'Hospital: ', 'number': '+81 3-1234-5678'},
    {'description': 'Ambulance: ', 'number': '+1 123-456-7890'},
    {'description': 'Blood Bank: ', 'number': '+44 20 7946 0958'},
    {'description': 'Hospital: ', 'number': '+81 3-1234-5678'},
    {'description': 'Ambulance: ', 'number': '+1 123-456-7890'},
    {'description': 'Blood Bank: ', 'number': '+44 20 7946 0958'},
    {'description': 'Hospital: ', 'number': '+81 3-1234-5678'},
  ];

  EmergencyNumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Important Phone Numbers',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: phoneNumbers.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Center(
              child: Column(
                children: [
                  ListTile(
                    title: Row(
                      children: [
                        Text(
                          phoneNumbers[index]['description']!,
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          phoneNumbers[index]['number']!,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 1.0,
                    color: Colors.grey,
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
