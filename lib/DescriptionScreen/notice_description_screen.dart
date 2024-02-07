import 'package:flutter/material.dart';

class NoticeDescriptionScreen extends StatelessWidget {
  const NoticeDescriptionScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('LCCI Globals Private Limited'),
        ),
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: <Widget>[
              Container(
                height: 280,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://images.pexels.com/photos/3095621/pexels-photo-3095621.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 250,
                left: 0,
                right: 0,
                bottom: 0,
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                      ),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LCCI GLOBAL PRIVATE LIMITED',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Text('It is a organization.It is an Authorized Place.It is an organizational institute.It is an Authorized Place.It is an organizational institute',
                            style: TextStyle(fontSize: 16)),
                      ],
                    ),
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
