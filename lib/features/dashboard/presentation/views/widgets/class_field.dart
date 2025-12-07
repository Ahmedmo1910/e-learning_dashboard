import 'package:flutter/material.dart';

class ClassField extends StatelessWidget {
  const ClassField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: const Text("Select a class..."),
          items: const [
            DropdownMenuItem(value: "A", child: Text("Class A")),
            DropdownMenuItem(value: "B", child: Text("Class B")),
            DropdownMenuItem(value: "C", child: Text("Class C")),
            DropdownMenuItem(value: "D", child: Text("Class D")),
          ],
          onChanged: (value) {},
        ),
      ),
    );
  }
}
