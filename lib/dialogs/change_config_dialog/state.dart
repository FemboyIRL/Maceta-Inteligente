import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ChangeConfigDialogState extends GetxController {
  double value;
  String label;

  ChangeConfigDialogState({required this.value, required this.label});

  void incrementValue() {
    value += 1.0;
    update();
  }

  void decrementValue() {
    value -= 1.0;
    update();
  }
}
