import 'package:flutter/material.dart';

class NewsDescriptionScreen extends StatelessWidget {
  final String title;
  final String description;
  final String? banner_image;

  NewsDescriptionScreen({
    required this.title,
    required this.description,
    required this.banner_image,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: <Widget>[
              Container(
                height:280,
                child: Image.network(
                  banner_image != null && banner_image!.isNotEmpty
                      ? 'https://lekhnathcci.org.np/storage/uploads/news/banner/'+banner_image!
                      : 'assets/images/logo_t.png',
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                    return Image.asset(
                      'assets/images/logo_t.png',
                      fit: BoxFit.cover,
                    );
                  },
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
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$title',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Text('$description', style: TextStyle(fontSize: 16)),
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
