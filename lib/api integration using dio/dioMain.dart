import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sep_advancedtopics/api%20integration%20using%20dio/view/dataHome.dart';

void main(){
  runApp(DioMain());
}
class DioMain extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home:DataHomeDio()
    );
  }
}
