import 'package:flutter/material.dart';

import '../DescriptionScreen/news_description_screen.dart';
import '../HTTPPackages/api_services.dart';
import '../model/news_model.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final ApiService _apiService = ApiService('https://lekhnathcci.org.np/api/');
  final ScrollController _scrollController = ScrollController();
  final List<NewsItem> _newsList = [];
  bool _isLoading = false;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _fetchNews();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _fetchNews();
    }
  }

  Future<void> _fetchNews() async {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });
      final apiData = await _apiService.fetchNews(_page);
      setState(() {
        _isLoading = false;
        _newsList.addAll(apiData.data.data);
        _page++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _newsList.length + 1,
      itemBuilder: (context, index) {
        if (index < _newsList.length) {
          NewsItem newsItem = _newsList[index];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDescriptionScreen(
                          title: newsItem.title,
                          description: newsItem.description,
                          banner_image: newsItem.banner_image ?? '',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                    ),
                    child: Image.network(
                      newsItem.banner_image != null && newsItem.banner_image!.isNotEmpty
                          ? 'https://lekhnathcci.org.np/storage/uploads/news/banner/'+newsItem.banner_image!
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
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDescriptionScreen(
                          title: newsItem.title,
                          description: newsItem.description,
                          banner_image: newsItem.banner_image ?? '',
                        ),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        newsItem.title,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          );
        } else if (_isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
