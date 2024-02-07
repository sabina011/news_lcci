import 'package:flutter/material.dart';

class AboutDeveloperScreen extends StatelessWidget {
  const AboutDeveloperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Developer Screen'),
        ),
        body: const Column(
          children: [
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Text('The Developer Screen is a fundamental component within a application designed to showcase information about the developers involved in creating and maintaining the software. Through the Developer Screen, users gain insight into the individuals contributing to the development process, including their names, roles, and possibly additional contact information or biographical details. This screen typically provides transparency regarding the development team composition, fostering trust and accountability between users and developers. By highlighting the individuals behind the code, the Developer Screen not only humanizes the development process but also serves as a testament to the collaborative effort '),
            ),
          ],
        ),
      ),
    );
  }
}
