import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:midterm/data/helper/methods_helper.dart';
import 'package:midterm/data/models/model.dart';

import 'home_screen.dart';

class DetailsScreen extends StatefulWidget {
  static const routeName = "/details-screen";
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final Car car = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Detail page', textAlign: TextAlign.center, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
        leading: IconButton(
          icon: Icon(Icons.delete),
          color: Colors.white,
          iconSize: 40,
          onPressed: () {
            MethodHelper().deleteCar(car.id);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Image.network(
                car.imageUrl,
                height: 250,
              ),
              Text(
                'Brand : ' + car.brand,
                style: Theme.of(context).textTheme.headline3..color.value,
              ),
              Text(
                'Model : ' + car.model,
                style: Theme.of(context).textTheme.headline3..color.value,
              ),
              Text(
                'Year : ' + car.year.toString(),
                style: Theme.of(context).textTheme.headline3..color.value,
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Description : ' + car.description,
                style: Theme.of(context).textTheme.headline6..color.value,
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                ),
                child: Text("Back"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
