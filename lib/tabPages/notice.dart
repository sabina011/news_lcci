import 'package:flutter/material.dart';

import '../DescriptionScreen/notice_description_screen.dart';
import '../HTTPPackages/api_services.dart';

class NoticeScreen extends StatefulWidget {
  const NoticeScreen({super.key});

  @override
  State<NoticeScreen> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  final ApiService _apiService = ApiService('https://lekhnathcci.org.np/api/');

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: _apiService.fetchNotice(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error loading news: ${snapshot.error}'),
          );
        } else {
          final apiData = snapshot.data?.data;

          if (apiData == null || apiData.isEmpty) {
            return Center(
              child: Text('No data available'),
            );
          }

          return ListView.builder(
            itemCount: apiData.length,
            itemBuilder: (context, index) {
              final item = apiData[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NoticeDescriptionScreen(),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.asset(
                          'assets/images/l.png',
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    SingleChildScrollView(
                      child: Container(
                        height: 150,
                        width: 230,
                        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 12.0),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                item.title,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              item.description,
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}