import 'package:flutter/material.dart';

// ignore: camel_case_types
class Instructions_field extends StatelessWidget {
  const Instructions_field({
    super.key,
    required TextEditingController instructionsController,
  }) : _instructionsController = instructionsController;

  final TextEditingController _instructionsController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _instructionsController,
      maxLines: 5,
      decoration: const InputDecoration(
        labelText: 'Instructions',
        hintText: 'Add instructions for your students...',
        border: OutlineInputBorder(),
      ),
    );
  }
}
