import 'package:flutter/material.dart';

class ClassField extends StatelessWidget {
  final String? selectedClass;
  final ValueChanged<String?> onChanged;

  const ClassField({
    super.key,
    required this.selectedClass,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F4),
        border: Border.all(color: const Color(0xFFDEDEDE)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: selectedClass,
          hint: const Text("Select a class..."),
          items: const [
            DropdownMenuItem(value: "A", child: Text("Class A")),
            DropdownMenuItem(value: "B", child: Text("Class B")),
            DropdownMenuItem(value: "C", child: Text("Class C")),
            DropdownMenuItem(value: "D", child: Text("Class D")),
          ],
          onChanged: onChanged,
        ),
      ),
    );
  }
}