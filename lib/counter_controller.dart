import 'package:get/get.dart';

class CounterController extends GetxController {
  int counter = 0;

  enterCounterValue(int value){
    counter = value;
    update();
  }

  increment(){
    counter += 1;
    print("val "+counter.toString());
    update();
  }

  decrement(){
    counter -= 1;
    update();
  }
}