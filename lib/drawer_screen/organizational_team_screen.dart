import 'package:flutter/material.dart';
import '../HTTPPackages/api_services.dart';
import '../model/organization_member_models.dart';

class OrganizationTeamScreen extends StatefulWidget {

  @override
  State<OrganizationTeamScreen> createState() => _OrganizationTeamScreenState();
}

class _OrganizationTeamScreenState extends State<OrganizationTeamScreen> {
  ApiService _apiService = ApiService('https://lekhnathcci.org.np/api/');
  List<OrganizationalModel> data = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Organization Members List'),
      ),
      body: FutureBuilder(
        future: _apiService.fetchOrganizationalMembers(1),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            print('Error loading members: ${snapshot.error}');
            return Center(
            child: Text('Error loading members'),
            );

          } else {
            final OrganizationalResponse? organizationalResponse = snapshot.data;

            if (organizationalResponse == null ||
                organizationalResponse.data.isEmpty) {
              return Center(
                child: Text('Data is null'),
              );
            }
            final List<OrganizationalModel> organizationalModelList = organizationalResponse.data;

            return ListView.builder(
              itemCount: organizationalModelList.length,
              itemBuilder: (context, index) {
                OrganizationalModel member = organizationalModelList[index];
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
                              child: Image.network(
                                'https://lekhnathcci.org.np/storage/uploads/team/image/'+member.image,
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
                                      member.name,
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    member.designation ?? '',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    member.phoneNo ?? '',
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
