import 'package:flutter/material.dart';
import 'package:midterm/data/helper/methods_helper.dart';
import 'package:midterm/data/models/model.dart';

import 'home_screen.dart';

class AddProduct extends StatelessWidget {
  static const routeName = "add-new-car";

  final _formKey = GlobalKey<FormState>();

  TextEditingController carID = TextEditingController();
  TextEditingController carBrand = TextEditingController();
  TextEditingController carModel = TextEditingController();
  TextEditingController carYear = TextEditingController();
  TextEditingController carDescription = TextEditingController();
  TextEditingController carImageUrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
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
                      decoration: InputDecoration(hintText: "Please enter image URL" ),
                      validator: (value){
                        if(value == null || value.isEmpty) {
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
                      decoration: InputDecoration(hintText: "Please enter ID" ),
                      keyboardType: TextInputType.number,
                      validator: (value){
                        if(value == null || value.isEmpty) {
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
                      decoration: InputDecoration(hintText: "Please enter brand" ),
                      validator: (value){
                        if(value == null || value.isEmpty) {
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
                      decoration: InputDecoration(hintText: "Please enter model" ),
                      validator: (value){
                        if(value == null || value.isEmpty) {
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
                      decoration: InputDecoration(hintText: "Please enter year" ),
                      keyboardType: TextInputType.number,
                      validator: (value){
                        if(value == null || value.isEmpty) {
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
                      decoration: InputDecoration(hintText: "Please enter description" ),
                      validator: (value){
                        if(value == null || value.isEmpty) {
                          return "Please enter valid description";
                        }
                        return null;
                      },
                    ),
                    elevation: 3.0,
                  ),
                  
                  SizedBox(
                    height: 50,
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
                          if (_formKey.currentState.validate()){
                            Car car = Car(
                              id: int.tryParse(carID.text),
                              brand: carBrand.text,
                              model: carModel.text,
                              year: int.tryParse(carYear.text),
                              description: carDescription.text,
                              imageUrl: carImageUrl.text,
                            );
                            MethodHelper().addCar(car);
                            Navigator.pop(context);Navigator.push(
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
