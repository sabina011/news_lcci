import 'package:flutter/material.dart';
import '../model/events_models.dart';
import '../DescriptionScreen/event_description_screen.dart';
import '../HTTPPackages/api_services.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  final ApiService _apiService = ApiService('https://lekhnathcci.org.np/api/');
  List<dynamic> events = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _apiService.fetchEvents(1),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error loading events'),
          );
        } else {
          final apiData = snapshot.data?.data;

          if (apiData == null || apiData.events.isEmpty) {
            return const Center(
              child: Text('No data available'),
            );
          }

          List<Event> eventList = apiData.events;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Events',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10,),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: eventList.length,
                  itemBuilder: (context, index) {
                    Event event = eventList[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EventsDescriptionScreen(
                                  title: event.title,
                                  description: event.description,
                                ),
                              ),
                            );
                          },
                          child: Image.network(
                            'https://images.pexels.com/photos/3095621/pexels-photo-3095621.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          event.title,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 30,),
                        Text(event.fromDateEn),
                        const SizedBox(height: 15,),
                        Text(event.toDateEn),
                      ],
                    );
                  },
                ),
              ],
            ),
          );
        }
      },
    );
  }
}