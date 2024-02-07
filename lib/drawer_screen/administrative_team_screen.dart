import 'package:flutter/material.dart';
import '../HTTPPackages/api_services.dart';


class AdministrativeTeamScreen extends StatelessWidget {
  ApiService _apiService = ApiService('https://lekhnathcci.org.np/api/');
   AdministrativeTeamScreen({Key? key});

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
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Center(
                  child: Text(
                    'No Data Available',
                  ),
                ),
              ),
              body: ListView.builder(
                itemCount: apiData.length,
                itemBuilder: (context, index) {
                  final item = apiData[index];
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
            
                        Text('Hari Bahadur Timalsina'),
                        Text('Age: 26'),
                        Text('past presidents'),
                        Text('2072-2079'),
                        SizedBox(height: 30),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}
