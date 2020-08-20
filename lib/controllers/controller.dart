import 'package:get/state_manager.dart';

class AnimalsController extends GetxController {
  var list = [].obs;

  add(item) => list.add(item);

  remove(index) => list.removeAt(index);
}