import 'package:flutter/material.dart';

class OrderListScreen extends StatelessWidget {
  final List<String> imageUrls = [
    'https://via.placeholder.com/80',
    'https://via.placeholder.com/80',
    'https://via.placeholder.com/80',
    'https://via.placeholder.com/80',
    // Add more images if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Images container
          Flexible(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < imageUrls.length && i < 3; i++)
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Image.network(
                        imageUrls[i],
                        width: 80,
                        height: 80,
                      ),
                    ),
                  // If there are more than 3 images, show +count
                  if (imageUrls.length > 3)
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(     width: 80,
                        height: 80,
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        color: Colors.grey[300],
                        child: Center(
                          child: Text(
                            '+${imageUrls.length - 3} more',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
