import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stuentmanagment_app/Model/student.dart';
import 'package:stuentmanagment_app/Screens/add_student.dart';

void snackBarFunction({
  required String title,
  required String subtitle,
  Duration? animationDuration,
  SnackPosition? snackPosition,
  Color? backgroundColor,
  DismissDirection? dismissDirection,
}) {
  Get.snackbar(title, subtitle,
      animationDuration: animationDuration,
      isDismissible: true,
      snackPosition: snackPosition,
      backgroundColor: backgroundColor,
      dismissDirection: dismissDirection);
}

void showDeleteConfirmationDialog(BuildContext context, StudentModel student) {
  Get.defaultDialog(
      backgroundColor: Colors.white.withOpacity(0.8),
      title: 'CONFIRM DELETION',
      content: Text(
        'Sure To Remove ${student.name}?',
        selectionColor: Colors.white,
      ),
      cancel: ElevatedButton(
        style: const ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll(Color.fromARGB(255, 84, 183, 82))),
        onPressed: () {
          Get.back();
        },
        child: const Text('Cancel'),
      ),
      confirm: ElevatedButton(
        style: const ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll(Color.fromARGB(255, 190, 67, 67))),
        onPressed: () {
          studentsController.deleteStudent(int.parse(student.id.toString()));
          Get.back();

          showDeleteConfirmationSnackBar(context, student);
        },
        child: const Text('OK'),
      ));
}

void showStudentDetailsDialog(BuildContext context, StudentModel student) {
  Get.dialog(
    Dialog(
      backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      child: Container(
        height: 500,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: FileImage(File(student.imageUrl)), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 130, 128, 128).withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
            ),
          ],
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.black,
            child: ListView(
              shrinkWrap: true,
              children: [
                Center(
                  child: Text(
                    student.name.toUpperCase(),
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                // Constants().kheight20,
                Center(
                  child: Text(
                    'Age: ${student.age}',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Department: ${student.department.toUpperCase()}',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Place: ${student.place}',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Guardian Name: ${student.guardianName}',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Phone No: ${student.phoneNumber}',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

void showDeleteConfirmationSnackBar(
    BuildContext context, StudentModel student) {
  Get.snackbar(
    "Delete ConfirmED",
    "You  Deleted ${student.name}?",
    duration: const Duration(seconds: 5),
    snackPosition: SnackPosition.BOTTOM,
    colorText: Colors.white,
    mainButton: TextButton(
      onPressed: () {},
      child: const Text(
        "DELETED",
        style: TextStyle(color: Color.fromARGB(255, 255, 2, 2)),
      ),
    ),
  );
}
