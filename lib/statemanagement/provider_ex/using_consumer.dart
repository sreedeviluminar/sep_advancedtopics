import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/counter_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => CounterProvider(),
        child: MyHomePage(),
      ),
    );
  }
}
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider with Consumer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Counter Value:',
              style: TextStyle(fontSize: 18),
            ),
            // Using Consumer to listen to changes in CounterProvider
            Consumer<CounterProvider>(
              builder: (context, counterProvider, child) {
                return Text(
                  '${counterProvider.counter}',
                  style: const TextStyle(fontSize: 24,
                      fontWeight: FontWeight.bold),
                );},),],),),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Using Consumer to call the increment method
          Provider.of<CounterProvider>(context, listen: false).increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}