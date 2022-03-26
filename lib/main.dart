import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_getx_controller_example/counter_widget.dart';
import 'package:multi_getx_controller_example/parent_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final ParentController _controller = ParentController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Obx((){
        return ListView.builder(itemBuilder: (_ , index){
          return CounterWidget(
              textEditingController: TextEditingController() ,
              controller: _controller.counters[index],
          );
        }, itemCount: _controller.counters.length,);
      }),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _controller.addCounter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
