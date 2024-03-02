import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.text});
  final Function()? onPressed;
  final String text;
  final double radius = 0.0;
  final bool isUpperCase =true;
  final double width = double.infinity;
  final Color background = Colors.blue;
  final double height = 40.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      child: MaterialButton(
        height: height,
        onPressed: onPressed,
        child: Text(
          isUpperCase ? text.toUpperCase() : text ,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
