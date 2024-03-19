import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stuentmanagment_app/Core/constants.dart';
import 'package:stuentmanagment_app/Screens/Widgets/app_bar.dart';
import 'package:stuentmanagment_app/Screens/Widgets/circle_avathar.dart';
import 'package:stuentmanagment_app/Screens/Widgets/form_field.dart';
import 'package:stuentmanagment_app/VIewmodel/student_controller.dart';

final StudentController studentsController = Get.put(StudentController());

class AddStudentScreen extends StatelessWidget {
  const AddStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController departmentController = TextEditingController();
    TextEditingController placeController = TextEditingController();
    TextEditingController phoneNoController = TextEditingController();
    TextEditingController guardianNameController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    RxString pickedimage = RxString('');
    return Scaffold(
      backgroundColor: Colors.black,
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
                    String? imagePath =
                        await studentsController.pickImage(ImageSource.gallery);
                    pickedimage.value = imagePath ?? '';
                  },
                  child:
                      CircleAvatarWidget(pickedimage: pickedimage, radius: 80),
                ),
              ),
              Constants().kheight20,
              FormWidget(formKey: formKey, nameController: nameController,
               ageController: ageController,
                departmentController: departmentController,
                 placeController: placeController,
                  phoneNoController: phoneNoController, 
                  guardianNameController: guardianNameController,
                   pickedimage: pickedimage)
            ],  
          ),
        )),
      ),
    );
  }
}


