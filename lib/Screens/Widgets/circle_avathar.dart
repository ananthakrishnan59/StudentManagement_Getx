import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CircleAvatarWidget extends StatelessWidget {
  const CircleAvatarWidget({super.key,
  required this.pickedimage,
  this.radius});

  final RxString pickedimage;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return Obx(() => CircleAvatar(
      radius: radius,
      backgroundColor:  Color.fromARGB(255, 216, 210, 210),
      backgroundImage: pickedimage.isNotEmpty
      ? FileImage(File(pickedimage.value))
      :null,
      child: pickedimage.isEmpty
      ? Icon(Icons.person,size: 35,)
      :null
    ));
  }
}
