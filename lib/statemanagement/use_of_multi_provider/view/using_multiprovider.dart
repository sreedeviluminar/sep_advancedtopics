import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sep_advancedtopics/statemanagement/use_of_multi_provider/provider/auth_provider.dart';
import 'package:sep_advancedtopics/statemanagement/use_of_multi_provider/provider/counter_provider.dart';

void main() {
  runApp(MaterialApp(
    home: MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Count_provider()),
        ChangeNotifierProvider(create: (context) => Auth_Provider()),
      ],
      child: Multi_Providerr(),
    ),
  ));
}

class Multi_Providerr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Counter Value",
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
                onPressed: () {
                  Provider.of<Count_provider>(context, listen: false)
                      .increment();
                },
                child: const Text("Increment Counter")),
            Text(
              "Count value :${Provider.of<Count_provider>(context).count}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Auth Details",
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
                onPressed: () {
                  Provider.of<Auth_Provider>(context,listen: false).login
                      ? Provider.of<Auth_Provider>(context,listen: false).logedOut()
                      : Provider.of<Auth_Provider>(context,listen: false).logedin();
                },
                child: const Text("Switch Login")),
            Consumer<Auth_Provider>(builder: (context, authprovider, child) {
              return Text(
                  "User is ${authprovider.login ? "Logged In" : "Logged Out"}");
            })
          ],
        ),
      ),
    );
  }
}
