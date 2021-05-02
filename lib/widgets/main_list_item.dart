import 'package:flutter/material.dart';

class MainListItem extends StatelessWidget {
  final String brand;
  final String model;
  final String imageUrl;
  final String year;

  MainListItem({
    this.brand,
    this.model,
    this.imageUrl,
    this.year,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Flexible(
              child: Container(
                child: FadeInImage(
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: AssetImage("asset/image/car_placeholder.png"),
                  image: NetworkImage(imageUrl),
                ),
              ),
            ),
            Text(
              '$brand - $model',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              '$year year',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
