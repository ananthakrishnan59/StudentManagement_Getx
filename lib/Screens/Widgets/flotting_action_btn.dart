import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stuentmanagment_app/Core/constants.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({super.key, this.page});
  final dynamic page;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 5,
      backgroundColor: const Color.fromARGB(255, 60, 59, 59),
      onPressed: () {
        Get.to(page);
      },
      child: Icon(
        Icons.add,
        color: Constants().whiteColor,
      ),
    );
  }
}
