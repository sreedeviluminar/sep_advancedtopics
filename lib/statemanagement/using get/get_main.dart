import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sep_advancedtopics/statemanagement/using%20get/controller.dart';

void main() {
  runApp(const GetMaterialApp(
    home: Get_Main(),
  ));
}

class Get_Main extends StatelessWidget {
  const Get_Main({super.key});

  @override
  Widget build(BuildContext context) {
    final CountController controller = Get.put(CountController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text("Count = ${controller.count}")),

            ElevatedButton(
                onPressed: () => controller.increment(),
                child: const Text("Increment")),

            const SizedBox(height: 15,),

            ElevatedButton(
                onPressed: () => controller.decrement(),
                child: const Text("Decrement"))
          ],
        ),
      ),
    );
  }
}
