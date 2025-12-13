import 'package:flutter/material.dart';
import 'package:teachers_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:teachers_dashboard/generated/l10n.dart';

class DatePickerField extends StatefulWidget {
  final ValueChanged<DateTime?> onDateChanged;

  final String labelText;

  const DatePickerField({
    super.key,
    required this.onDateChanged,
    this.labelText = 'Date',
  });

  @override
  State<DatePickerField> createState() => _DatePickerFieldSimpleState();
}

class _DatePickerFieldSimpleState extends State<DatePickerField> {
  final TextEditingController _controller = TextEditingController();
  DateTime? _selectedDate;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    return '${date.month}/${date.day}/${date.year}';
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF0D47A1),
              onPrimary: Colors.white,
              onSurface: Colors.black87,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _controller.text = _formatDate(picked);
      });
      widget.onDateChanged(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickDate,
      child: AbsorbPointer(
        child: CustomTextFormField(
          controller: _controller,
            labelText: S.of(context).date,
  hintText: S.of(context).selectDate,
          suffixIcon: const Icon(Icons.calendar_today),
        ),
      ),
    );
  }
}
