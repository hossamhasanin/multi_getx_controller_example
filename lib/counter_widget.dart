import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'counter_controller.dart';

class CounterWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final CounterController controller;
  const CounterWidget({Key? key ,
    required this.controller,
    required this.textEditingController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CounterController>(
      init: controller,
      global: false,
      builder: (_) {
        textEditingController.text = controller.counter.toString();
        print(controller.counter.hashCode);
        return Padding(
          padding: const EdgeInsets.only(left: 20.0 , right: 20 , bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: (){
                controller.increment();
              }, icon: const Icon(Icons.add)),
              Expanded(
                child: TextField(
                  controller: textEditingController,
                  onChanged: (text){
                    if (text.isNotEmpty){
                      controller.enterCounterValue(int.parse(text));
                      print("widget con hash  "+controller.counter.toString());
                    }
                  },
                ),
              ),
              IconButton(onPressed: (){
                controller.decrement();
              }, icon: const Icon(Icons.delete)),
            ],
          ),
        );
      }
    );
  }
}
