import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sep_advancedtopics/api%20integration%20using%20dio/controller/dataController.dart';
import 'package:sep_advancedtopics/api%20integration%20using%20dio/utils/colors.dart';
import 'package:sep_advancedtopics/api%20integration%20using%20dio/utils/const_snackabr.dart';

class DataHomeDio extends StatelessWidget {
  DataController controller = Get.put(DataController());

  /// initialize the controller
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Dio"),
        backgroundColor: MyColors.prColor,
      ),
      backgroundColor: MyColors.bgColor,
      floatingActionButton: Obx(
          () => controller.isNetConnected.value ? _buildFAB() : Container()),
      body: Obx(() => SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: controller.isNetConnected.value
                ? (controller.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : getData())
                : noInternet(context)
          )),
    );
  }

  RefreshIndicator getData() {
    return RefreshIndicator(onRefresh: (){
      return controller.fetchData();
    },
    child: ScrollablePositionedList.builder(
        itemScrollController:controller.scrollController  ,
        itemCount: controller.datas.length,
        itemBuilder: (context,index){
          return InkWell(
           // onTap: ()=>Get.to(),
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: MyColors.scColor,
                  child: Text(controller.datas[index].id.toString()),
                ),
                title: Text("${controller.datas[index].title}"),
                subtitle: Text("${controller.datas[index].body}"),
              ),
            ),
          );
        }),);
  }

  FloatingActionButton _buildFAB() {
    return FloatingActionButton(
      onPressed: () {
        controller.isListDown.value
            ? controller.scrollToUp()
            : controller.scrollToDown();
      },
      backgroundColor: MyColors.prColor,
      child: FaIcon(controller.isListDown.value
          ? FontAwesomeIcons.arrowUp19
          : FontAwesomeIcons.arrowDown19),
    );
  }

 Center noInternet(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("No Internet"),
          MaterialButton(
            color: MyColors.prColor,
            child: const Text("Try Again"),
              onPressed: ()async{
                if(await InternetConnectionChecker().hasConnection){
                  controller.fetchData();
                }else{
                  showCustomSnackBar(context);
                }
              })
        ],
      ),
    );
 }

}
