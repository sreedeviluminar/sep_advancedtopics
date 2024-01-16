import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sep_advancedtopics/statemanagement/provider_ex/controller/theme_controller.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp1()));
}

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: Provider.of<ThemeProvider>(context).isDarkTheme
            ? ThemeData.dark()
            : ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: App_Theme_changer());
  }
}

class App_Theme_changer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Provider.of<ThemeProvider>(
                  context, listen: false).switchTheme();
            },
            child: Text("Switch Thme")),
      ),
    );
  }
}
