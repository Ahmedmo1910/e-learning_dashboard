import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  void Function()? onClick;
  String text;
  CustomButton({super.key, this.onClick, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: const Color(0xff0F1A2C),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(text, style: TextStyle(fontSize: 17, color: Colors.white)),
      ),
    );
  }
}
