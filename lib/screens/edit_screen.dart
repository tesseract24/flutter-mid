import 'package:flutter/material.dart';
import 'package:midterm/data/helper/methods_helper.dart';
import 'package:midterm/data/models/model.dart';

import 'home_screen.dart';

class EditScreen extends StatefulWidget {
  static const routName = "/edit-car-screen";
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController carID;
  TextEditingController carBrand;
  TextEditingController carModel;
  TextEditingController carYear;
  TextEditingController carDescription;
  TextEditingController carImageUrl;

  @override
  Widget build(BuildContext context) {
    final Map parseData = ModalRoute.of(context).settings.arguments;
    final Car car = parseData["car"];
    final int index = parseData["index"];
    carID = TextEditingController(text: car.id.toString());
    carBrand = TextEditingController(text: car.brand);
    carModel = TextEditingController(text: car.model);
    carYear = TextEditingController(text: car.year.toString());
    carDescription = TextEditingController(text: car.description);
    carImageUrl = TextEditingController(text: car.imageUrl);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Edit page', textAlign: TextAlign.center, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Card(
                  child: TextFormField(
                    controller: carImageUrl,
                    decoration: InputDecoration(hintText: "Please enter image URL"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid image URL";
                      }
                      return null;
                    },
                  ),
                  elevation: 3.0,
                ),
                Card(
                  child: TextFormField(
                    controller: carID,
                    decoration: InputDecoration(hintText: "Please enter ID"),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid ID";
                      }
                      return null;
                    },
                  ),
                  elevation: 3.0,
                ),
                Card(
                  child: TextFormField(
                    controller: carBrand,
                    decoration: InputDecoration(hintText: "Please enter brand"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid brand";
                      }
                      return null;
                    },
                  ),
                  elevation: 3.0,
                ),
                Card(
                  child: TextFormField(
                    controller: carModel,
                    decoration: InputDecoration(hintText: "Please enter model"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid model";
                      }
                      return null;
                    },
                  ),
                  elevation: 3.0,
                ),
                Card(
                  child: TextFormField(
                    controller: carYear,
                    decoration: InputDecoration(hintText: "Please enter year"),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid year";
                      }
                      return null;
                    },
                  ),
                  elevation: 3.0,
                ),
                Card(
                  child: TextFormField(
                    controller: carDescription,
                    decoration: InputDecoration(hintText: "Please enter description"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid description";
                      }
                      return null;
                    },
                  ),
                  elevation: 3.0,
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      ),
                      child: Text("Back"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Car car = Car(
                            id: int.tryParse(carID.text),
                            brand: carBrand.text,
                            model: carModel.text,
                            year: int.tryParse(carYear.text),
                            description: carDescription.text,
                            imageUrl: carImageUrl.text,
                          );
                          MethodHelper().editCar(car, index);
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen()),
                          );
                        }
                      },
                      child: Text("Add"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
