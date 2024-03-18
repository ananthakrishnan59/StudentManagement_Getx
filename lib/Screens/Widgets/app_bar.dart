import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stuentmanagment_app/Core/constants.dart';

class AppBarWidgets extends StatelessWidget {
  const AppBarWidgets(
      {super.key,
      this.lefticon,
      this.righticon,
      required this.title,
      this.onTapLeft,
      this.onTapRight});

  final IconData? lefticon;
  final IconData? righticon;
  final String title;
  final void Function()? onTapLeft;
  final void Function()? onTapRight;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: GoogleFonts.poppins(color: Colors.white, fontSize: 25),
      ),
      elevation: 0,
      leading: InkWell(
        child: Icon(
          lefticon,
          color: Constants().whiteColor,
        ),
        onTap: () {
          onTapLeft?.call();
        },
      ),
      actions: [
        InkWell(
          child: Icon(
            righticon,
            color: Constants().whiteColor,
            size: 30,
          ),
          onTap: () {
            onTapRight?.call();
          },
        )
      ],
      centerTitle: true,
      backgroundColor: Colors.black,
    );
  }
}
