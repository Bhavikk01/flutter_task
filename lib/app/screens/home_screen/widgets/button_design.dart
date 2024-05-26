import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/scale_utility.dart';

class ButtonDesign extends StatelessWidget {
  ButtonDesign({required this.text, Key? key}) : super(key: key);
  final String text;
  final scale = Get.find<ScalingUtility>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: scale.getScaledHeight(98),
      width: scale.getScaledWidth(97),
      padding: scale.getPadding(
        top: 12,
        bottom: 5,
        left: 14,
        right: 12,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(4,4),
            blurRadius: 20,
            spreadRadius: 0,
            color: const Color(0xff6F8CB0).withOpacity(0.41),
          ),
          const BoxShadow(
            offset: Offset(-6,-6),
            blurRadius: 20,
            spreadRadius: 0,
            color: Colors.white,
          ),
        ],
        color: const Color(0xffE3EDF7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              'assets/nutritionist.png',
              height: scale.getScaledHeight(26),
              width: scale.getScaledWidth(25),
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              text,
              style: GoogleFonts.outfit(
                fontSize: scale.getScaledFont(12),
                fontWeight: FontWeight.w500,
                color: const Color(0xff3D5284),
              ),
            ),
          )
        ],
      ),
    );
  }
}
