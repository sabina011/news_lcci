import 'package:flutter/material.dart';
import '../HTTPPackages/api_services.dart';
import '../model/past_presidents_models.dart';

class PastPresidentsScreen extends StatefulWidget {
  const PastPresidentsScreen({super.key});

  @override
  _PastPresidentsScreenState createState() => _PastPresidentsScreenState();
}

class _PastPresidentsScreenState extends State<PastPresidentsScreen> {
  final ApiService _apiService = ApiService('https://lekhnathcci.org.np/api/');
  List<PresidentModel> pastPresidents = [];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Past Presidents List'),
      ),
      body: FutureBuilder(
        future: _apiService.fetchPastPresidents(1),
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error loading data'),
            );
          } else {
            final PresidentsResponse? presidentsResponse = snapshot.data;

            if (presidentsResponse == null ||
                presidentsResponse.data.isEmpty) {
              return Center(
                child: Text('No data available'),
              );
            }

            final List<PresidentModel> presidentModelList =
                presidentsResponse.data;

            return ListView.builder(
              itemCount: presidentModelList.length,
              itemBuilder: (context, index) {
                PresidentModel president = presidentModelList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child:Image.network(
                                president.image != null && president.image!.isNotEmpty
                                    ? 'https://lekhnathcci.org.np/storage/uploads/team/image/' + president.image!
                                    : 'https://images.pexels.com/photos/1562/italian-landscape-mountains-nature.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', // Replace with your placeholder image
                                height: 80,
                                width: 80,
                                fit: BoxFit.cover,
                                errorBuilder: (BuildContext context, Object exception,
                                    StackTrace? stackTrace) {
                                  return Image.asset(
                                    'assets/images/logo_t.png',
                                    width: 80,
                                    height: 80,
                                  );
                                },
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
                                      president.name,
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    (president.workingPeriod ?? ''),
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  Text(
                                    president.designation ?? '',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 40),
                        ],
                      ),
                      Divider(
                        height: 1,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                );
              },
            );

          }
        },
      ),
    );
  }
}
