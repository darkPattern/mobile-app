import 'package:flutter/material.dart';
import '../constants.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    Key? key,
    required this.buttonName,
    required this.bgColor,
    required this.textColor,
    required this.onPressed, // Add the onPressed function
  }) : super(key: key);

  final String buttonName;
  final Color bgColor;
  final Color textColor;
  final VoidCallback onPressed; // Define onPressed as a VoidCallback

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith(
                (states) => Colors.black12,
          ),
        ),
        onPressed: onPressed, // Set the onPressed function
        child: Text(
          buttonName,
          style: kButtonText.copyWith(color: textColor),
        ),
      ),
    );
  }
}
