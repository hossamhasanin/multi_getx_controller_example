import 'package:get/get.dart';
import 'package:multi_getx_controller_example/counter_controller.dart';

class ParentController extends GetxController{
  final RxList<CounterController> counters = <CounterController>[
    CounterController(),
    CounterController()
  ].obs;

  addCounter(){
    counters.add(CounterController());
  }

  @override
  void dispose() {
    for (var counter in counters){
      counter.dispose();
    }
    super.dispose();
  }
}