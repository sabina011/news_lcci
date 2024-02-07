import 'package:flutter/material.dart';
import '../HTTPPackages/api_services.dart';
import '../model/member_event.dart';


class MemberEventScreen extends StatefulWidget {
  const MemberEventScreen({Key? key}) : super(key: key);

  @override
  _MemberEventScreenState createState() => _MemberEventScreenState();
}

class _MemberEventScreenState extends State<MemberEventScreen> {
  final ApiService _apiService = ApiService('https://lekhnathcci.org.np/api/');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _apiService.fetchEvent(),
        builder: (context, AsyncSnapshot<EventsData> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error loading events'),
            );
          } else {
            final events = snapshot.data!.events;

            return ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                return ListTile(
                  title: Text(event.title),
                  leading: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 3.0,
                      ),
                    ),
                    child: Image.network(
                      event.logo.isNotEmpty
                          ? 'https://lekhnathcci.org.np/storage/uploads/events/' +event.logo
                          : 'assets/images/logo_t.png',
                      height: 300,
                      width: 200,
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                        return Image.asset(
                          'assets/images/logo_t.png',
                          height: 200,
                          width: 100,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
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
