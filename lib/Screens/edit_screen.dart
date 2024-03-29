import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stuentmanagment_app/Core/constants.dart';
import 'package:stuentmanagment_app/Model/student.dart';
import 'package:stuentmanagment_app/Screens/Widgets/app_bar.dart';
import 'package:stuentmanagment_app/Screens/Widgets/circle_avathar.dart';
import 'package:stuentmanagment_app/Screens/Widgets/elevation_button.dart';
import 'package:stuentmanagment_app/Screens/Widgets/text_form.dart';
import 'package:stuentmanagment_app/Screens/add_student.dart';


class EditScreen extends StatelessWidget {
  const EditScreen({super.key, required this.student});
  final StudentModel student;
  @override
  Widget build(BuildContext context) {
    TextEditingController nameeditingController =
        TextEditingController(text: student.name);
    TextEditingController ageeditingController =
        TextEditingController(text: student.age.toString());
    TextEditingController departmenteditingController =
        TextEditingController(text: student.department);
    TextEditingController placeeditingController =
        TextEditingController(text: student.place);
    TextEditingController phoneNoeditingController =
        TextEditingController(text: student.phoneNumber.toString());
    TextEditingController guardianNameeditingController =
        TextEditingController(text: student.guardianName);
    final formKey = GlobalKey<FormState>();
    RxString pickedimage = RxString(student.imageUrl);

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 70),
          child: AppBarWidgets(
            onTapLeft: () {
              Get.back();
            },
            title: 'Enter the details',
            lefticon: Icons.arrow_back,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              children: [
                Center(
                  child: InkWell(
                    onTap: () async {
                      String? imagePath = await studentsController
                          .pickImage(ImageSource.gallery);
                      pickedimage.value = imagePath ?? '';
                    },
                    child: CircleAvatarWidget(
                        pickedimage: pickedimage, radius: 80),
                  ),
                ),
                Constants().kheight20,
                Form(
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
                          controller: nameeditingController,
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
                          controller: ageeditingController,
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
                            controller: departmenteditingController,
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
                          controller: placeeditingController,
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
                          controller: phoneNoeditingController,
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
                          controller: guardianNameeditingController,
                          hintText: 'Enter the name of the Guardian',
                          labelText: 'Guardian Name',
                          inputType: TextInputType.name,
                        ),
                        Constants().kheight10,
                        ElevationButtonWidget(
                            formKey: formKey,
                            pickedimage: pickedimage,
                            student: student,
                            nameeditingController: nameeditingController,
                            ageeditingController: ageeditingController,
                            departmenteditingController:
                                departmenteditingController,
                            placeeditingController: placeeditingController,
                            phoneNoeditingController: phoneNoeditingController,
                            guardianNameeditingController:
                                guardianNameeditingController)
                      ],
                    ))
              ],
            ),
          )),
        ));
  }
}
