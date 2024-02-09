import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../model/product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListScreen(),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(name: 'Product 1', price: '100', imageUrl: 'https://hips.hearstapps.com/hmg-prod/images/hoka-zinal-13085-1643565794.jpg'),
    Product(name: 'Product 2', price: '150', imageUrl: 'https://assets.myntassets.com/dpr_1.5,q_60,w_400,c_limit,fl_progressive/assets/images/18274390/2022/5/14/c64644f6-840f-4496-bb42-19359e9881771652523841987RoadsterMenBrownTexturedPUSneakers1.jpg'),
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product App'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].name),
            subtitle: Text('Price: \$${products[index].price}'),
            leading: CachedNetworkImage(
              imageUrl: products[index].imageUrl,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              width: 50, // Set the width as needed
              height: 50, // Set the height as needed
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
