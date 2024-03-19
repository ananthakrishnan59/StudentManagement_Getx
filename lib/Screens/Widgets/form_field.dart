import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stuentmanagment_app/Core/constants.dart';
import 'package:stuentmanagment_app/Model/student.dart';
import 'package:stuentmanagment_app/Screens/Widgets/text_form.dart';
import 'package:stuentmanagment_app/Screens/add_student.dart';
import 'package:stuentmanagment_app/Services/function.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.ageController,
    required this.departmentController,
    required this.placeController,
    required this.phoneNoController,
    required this.guardianNameController,
    required this.pickedimage,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController ageController;
  final TextEditingController departmentController;
  final TextEditingController placeController;
  final TextEditingController phoneNoController;
  final TextEditingController guardianNameController;
  final RxString pickedimage;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: [
            TextFormFieldWidget(
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value.length < 3) {
                  return 'please enter a valid name';
                }
                return null;
              },
              prefixicon: Icons.person,
              controller: nameController,
              hintText: 'Enter the name',
              labelText: 'Name',
              inputType: TextInputType.name,
            ),
            Constants().kheight10,
            TextFormFieldWidget(
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    int.parse(value) >= 120 ||
                    int.parse(value) <= 0) {
                  return 'please enter a valid age';
                }
                return null;
              },
              prefixicon: Icons.numbers,
              controller: ageController,
              hintText: 'Enter the age',
              labelText: 'Age',
              inputType: TextInputType.number,
            ),
            Constants().kheight10,
            TextFormFieldWidget(
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.length < 3) {
                    return 'please enter a valid department';
                  }
                  return null;
                },
                prefixicon: Icons.person,
                controller: departmentController,
                hintText: 'Enter the department',
                labelText: 'Department',
                inputType: TextInputType.text),
            Constants().kheight10,
            TextFormFieldWidget(
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value.length < 3) {
                  return 'please enter a valid place';
                }
                return null;
              },
              prefixicon: Icons.location_city,
              controller: placeController,
              hintText: 'Enter the place',
              labelText: 'Place',
              inputType: TextInputType.text,
            ),
            Constants().kheight10,
            TextFormFieldWidget(
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value.length != 10) {
                  return 'please enter a valid phone no';
                }
                return null;
              },
              prefixicon: Icons.phone,
              controller: phoneNoController,
              hintText: 'Enter the phone number',
              labelText: 'Contact Number',
              inputType: TextInputType.number,
            ),
            Constants().kheight10,
            TextFormFieldWidget(
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value.length < 3) {
                  return 'please enter a valid name';
                }
                return null;
              },
              prefixicon: Icons.person,
              controller: guardianNameController,
              hintText: 'Enter the name of the Guardian',
              labelText: 'Guardian Name',
              inputType: TextInputType.name,
            ),
            Constants().kheight10,
            ElevatedButton(
                style: ButtonStyle(
                    elevation: const MaterialStatePropertyAll(5),
                    backgroundColor: MaterialStatePropertyAll(
                        Constants().appColor)),
                onPressed: () {
                  // if every field is validated
                  if (formKey.currentState!.validate() &&
                      pickedimage.isNotEmpty) {
                    studentsController.addStudent(StudentModel(
                        name: nameController.text,
                        age: int.parse(ageController.text),
                        department: departmentController.text,
                        place: placeController.text,
                        phoneNumber:
                            int.parse(phoneNoController.text),
                        guardianName: guardianNameController.text,
                        imageUrl: pickedimage.string));
                    // clearing the fields after saving
                    nameController.clear();
                    ageController.clear();
                    departmentController.clear();
                    placeController.clear();
                    phoneNoController.clear();
                    guardianNameController.clear();
                    pickedimage.value = '';
                    print(
                        'form is validated ${studentsController.students}');
                    snackBarFunction(
                        title: 'Success',
                        subtitle: 'Submitted Successfully',
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
                        dismissDirection: DismissDirection.horizontal,
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
                    style: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 125, 228, 7),
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ))
          ],
        ));
  }
}