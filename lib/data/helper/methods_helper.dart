import 'package:midterm/data/models/dummy_data.dart';
import 'package:midterm/data/models/model.dart';

class MethodHelper {
  void addCar(Car car) {
    DUMMY_DATA.add(car);
  }

  void deleteCar(int id) {
    DUMMY_DATA.removeWhere((element) => element.id == id);
  }

  void editCar(Car car, int index) {
    DUMMY_DATA.replaceRange(index, index + 1, [
      car
    ]);
  }
}
