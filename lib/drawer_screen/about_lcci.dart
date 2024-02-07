import 'package:flutter/material.dart';

class AboutLcci extends StatelessWidget {
  const AboutLcci({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'About LCCI',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 30,),
                Center(
                    child: Text('Lekhnath Chamber of Commerce & Industry (LCCI), established in 4 July 1997 in Lekhnath city, is an autonomous, non-governmental and representative organization of business community')
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
