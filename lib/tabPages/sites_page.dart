import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../DescriptionScreen/site_description_screen.dart';
import '../HTTPPackages/api_services.dart';
import '../model/site_model.dart';

class Sites extends StatefulWidget {
  const Sites({super.key});

  @override
  State<Sites> createState() => _SitesState();
}


class _SitesState extends State<Sites> {
  late PageController _pageController;
  ApiService _apiService = ApiService('https://lekhnathcci.org.np/api/');


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
    return FutureBuilder<ApiResponses>(
      future: _apiService.fetchSites(1),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error loading sites data'),
          );
        } else {
          final apiResponse = snapshot.data;
          if (apiResponse == null ||
              apiResponse.data.isEmpty) {
            return const Center(
              child: Text('No sites data available'),
            );
          }

          final List<Site> sites = apiResponse.data;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: sites.length,
                    itemBuilder: (context, index) {
                      Site site = sites[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SiteDetailsScreen(site: site),
                                ),
                              );
                            },
                            child:Image.network(
                              site.bannerImage != null && site.bannerImage!.isNotEmpty
                                  ? 'https://lekhnathcci.org.np/storage/uploads/localSite/banner/' + site.bannerImage!
                                  : 'assets/images/logo_t.png',
                              height: 200,
                              width: 100,
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
                          SizedBox(height: 20),
                          Text(
                            site.name,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 30,),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Widget buildImage(String imageUrl) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
    );
  }
}
