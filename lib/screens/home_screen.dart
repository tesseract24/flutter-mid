import 'package:flutter/material.dart';
import 'package:midterm/data/models/dummy_data.dart';
import 'package:midterm/data/models/model.dart';
import 'package:midterm/screens/details_screen.dart';
import 'package:midterm/screens/edit_screen.dart';
import 'package:midterm/widgets/main_list_item.dart';

import 'add_new.dart';

class HomeScreen extends StatelessWidget {
  List<Car> carList = DUMMY_DATA;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Home page', textAlign: TextAlign.center, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
        leading: IconButton(
          icon: Icon(Icons.add),
          color: Colors.white,
          iconSize: 40,
          onPressed: () => Navigator.pushNamed(context, AddProduct.routeName),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 1,
        children: List.generate(carList.length, (index) {
          var car = carList[index];
          return GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              DetailsScreen.routeName,
              arguments: car,
            ),
            onLongPress: () {
              Navigator.pushNamed(
                context,
                EditScreen.routName,
                arguments: {
                  "car": car,
                  "index": index,
                },
              );
            },
            child: MainListItem(
              brand: car.brand,
              model: car.model,
              year: car.year.toString(),
              imageUrl: car.imageUrl,
            ),
          );
        }),
      ),
    );
  }
}
