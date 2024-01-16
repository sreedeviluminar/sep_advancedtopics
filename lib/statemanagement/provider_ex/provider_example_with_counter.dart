import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/counter_controller.dart';

void main() {
  runApp(MaterialApp(
    home: ChangeNotifierProvider(
        create: (context) => CounterProvider(), child: Counter_Provider_Ex()),
  ));
}

class Counter_Provider_Ex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var counterController = Provider.of<CounterProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider_Ex"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Increment counter',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 15,),
            Text(
              'Counter Value : ${counterController.counter.value} ',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 15,),
            ElevatedButton(
                onPressed: () {
                  counterController.increment();
                },
                child: const Text('Increment Value'))
          ],
        ),
      ),
    );
  }
}
