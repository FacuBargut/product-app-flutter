import 'package:flutter/material.dart';
import 'package:products_app/screens/screens.dart';
import 'package:products_app/services/product_service.dart';
import 'package:products_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final productService = Provider.of<ProductService>(context);
    
    if(productService.isLoading) return LoadingScreen();



    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
      ),
      body: ListView.builder(
        itemCount: productService.products.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () {
            productService.selectedProduct = productService.products[index].copy();
            Navigator.pushNamed(context, 'product');
          },
          child: ProductCard(product: productService.products[index]))

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {


            productService.selectedProduct = new Product(
                                                  available: false,
                                                  name: '',
                                                  price: 0
                                              );
            Navigator.pushNamed(context, 'product');

          },
        child: Icon(Icons.add),
      ),

    );
  }
}