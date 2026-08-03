import 'package:flutter/material.dart';
import 'package:mavazi/model/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 18, bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0), 
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            // Fixed: Spelled ClipRRect correctly and wrapped the network image inside it
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                product.imageUrl,
                width: 110, 
                height: 110,
                fit: BoxFit.cover, 
              ),
            ),
            const SizedBox(width: 16), 

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0), 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product.description,
                      style: const TextStyle(fontSize: 13, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'KES ${product.price.toStringAsFixed(0)}',
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ); 
  } 
}
