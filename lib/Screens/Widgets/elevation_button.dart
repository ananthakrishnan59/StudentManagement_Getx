
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stuentmanagment_app/Core/constants.dart';
import 'package:stuentmanagment_app/Model/student.dart';
import 'package:stuentmanagment_app/Screens/add_student.dart';
import 'package:stuentmanagment_app/Services/function.dart';

class ElevationButtonWidget extends StatelessWidget {
  const ElevationButtonWidget({
    super.key,
    required this.formKey,
    required this.pickedimage,
    required this.student,
    required this.nameeditingController,
    required this.ageeditingController,
    required this.departmenteditingController,
    required this.placeeditingController,
    required this.phoneNoeditingController,
    required this.guardianNameeditingController,
  });

  final GlobalKey<FormState> formKey;
  final RxString pickedimage;
  final StudentModel student;
  final TextEditingController nameeditingController;
  final TextEditingController ageeditingController;
  final TextEditingController departmenteditingController;
  final TextEditingController placeeditingController;
  final TextEditingController phoneNoeditingController;
  final TextEditingController guardianNameeditingController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            elevation: const MaterialStatePropertyAll(5),
            backgroundColor: MaterialStatePropertyAll(
                Constants().appColor)),
        onPressed: () {
          if (formKey.currentState!.validate() &&
              pickedimage.isNotEmpty) {
            studentsController.updateStudent(StudentModel(
                id: student.id,
                name: nameeditingController.text,
                age: int.parse(ageeditingController.text),
                department:
                    departmenteditingController.text,
                place: placeeditingController.text,
                phoneNumber: int.parse(
                    phoneNoeditingController.text),
                guardianName:
                    guardianNameeditingController.text,
                imageUrl: pickedimage.string));
            print(
                'form is validated ${studentsController.students}');
            snackBarFunction(
                title: 'Success',
                subtitle: 'Edited Successfully',
                backgroundColor: Colors.green,
                animationDuration:
                    const Duration(milliseconds: 2000),
                snackPosition: SnackPosition.BOTTOM);
          }
    
          // if the image is not picked up
          else if (pickedimage.isEmpty) {
            snackBarFunction(
                title: 'Submission Failed',
                subtitle: 'Please select an image',
                backgroundColor: Colors.red,
                dismissDirection:
                    DismissDirection.horizontal,
                snackPosition: SnackPosition.BOTTOM);
          } else {
            print('not valid');
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 25, vertical: 10),
          child: Text(
            'SUBMIT',
            style: GoogleFonts.openSans(
                color: Constants().whiteColor,
                fontWeight: FontWeight.w600,
                fontSize: 18),
          ),
        ));
  }
}