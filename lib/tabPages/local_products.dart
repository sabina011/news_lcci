import'package:flutter/material.dart';
import '../HTTPPackages/api_services.dart';
import '../model/local_products_models.dart';


class LocalProducts extends StatefulWidget {
  const LocalProducts({super.key});

  @override
  State<LocalProducts> createState() => _LocalProductsState();
}

class _LocalProductsState extends State<LocalProducts> {
  final ApiService _apiService = ApiService('https://lekhnathcci.org.np/api/');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProductModel?>(
      future: _apiService.fetchProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center
            (child: CircularProgressIndicator()
          );
        } else if (snapshot.hasError) {
          return Center(
              child: Text('Error loading local products: ${snapshot.error}'));

        }else if (snapshot.hasData) {
          ProductModel? product = snapshot.data;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Product Name: ${product!.name}',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Description: ${product.description}',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Price: ${product.price}',
                style: TextStyle(fontSize: 20),
              ),
              // You can display other product details here
            ],
          );
        } else {
          return const Center(
              child: Text('No data available'));
        }
      },
    );
  }
}
