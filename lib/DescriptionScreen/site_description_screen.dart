import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import '../model/site_model.dart';

class SiteDetailsScreen extends StatefulWidget {
  final Site site;

  SiteDetailsScreen({required this.site});

  @override
  _SiteDetailsScreenState createState() => _SiteDetailsScreenState();
}

class _SiteDetailsScreenState extends State<SiteDetailsScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.site.name),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 320,
              width: double.infinity,
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [
                  buildImage('https://images.pexels.com/photos/1562/italian-landscape-mountains-nature.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                  buildImage('https://images.pexels.com/photos/1562/italian-landscape-mountains-nature.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',),
                  buildImage('https://images.pexels.com/photos/1562/italian-landscape-mountains-nature.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          DotsIndicator(
            dotsCount: 3,
            position: _currentPage.toDouble(),
            decorator: DotsDecorator(
              color: Colors.grey,
              activeColor: Colors.blue,
            ),
          ),
          Expanded(
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
                    SizedBox(height: 20,),
                    Text(
                      widget.site.name,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text(widget.site.description, style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImage(String imageUrl) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
    );
  }
}
