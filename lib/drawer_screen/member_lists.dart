import 'package:flutter/material.dart';

import '../HTTPPackages/api_services.dart';
import 'member_detailedscreen.dart';

class MemberList extends StatelessWidget {
  ApiService _apiService = ApiService('https://lekhnathcci.org.np/api/');


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _apiService.fetchAdministrative(),
        builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
             return Center(
              child: CircularProgressIndicator(),
                );
                } else if (snapshot.hasError) {
             return Center(
                  child: Text('Error loading data: ${snapshot.error}'),
                   );
                 } else {
              final apiData = snapshot.data?.data;

              return Scaffold(
                  appBar: AppBar(
                     title: Center(
                         child: Text('No Data Available')),
                   ),
                 body: ListView.builder(
                    itemCount: apiData.length,
                  itemBuilder: (context, index) {
                  final item = apiData[index];

                          return GestureDetector(
                       onTap: () {
                          Navigator.push(
                             context,
                                MaterialPageRoute(
                                 builder: (context) => MemberDetailsScreen(),
                          ),
                            );
                           },
                            child: Padding(
                             padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 24),
                               child: Card(
                                elevation: 7,
                               child: Row(
                                   children: [
                                Padding(
                        padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.asset(
                          'assets/images/m.png',
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6.0,
                          vertical: 1.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                'member.Name',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              'Membership Number: MembershipNumber',
                              style: TextStyle(fontSize: 12),
                            ),

                            Text(
                              'Business Category: BusinessCategory',
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
    );
}
}


