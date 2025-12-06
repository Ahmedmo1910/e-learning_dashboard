// import 'package:flutter/material.dart';
// import 'package:teachers_dashboard/core/utils/app_colors.dart';

// class AppBarCreateExam extends StatelessWidget {
//   final VoidCallback onSave;
//   final bool isLoading;

//   const AppBarCreateExam({super.key, required this.onSave, this.isLoading = false});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: isLoading ? null : () => Navigator.pop(context),
//         ),
//         const SizedBox(width: 30),
//         Text("Create New Exam",
//             style: TextStyle(color: AppColors.darkPrimaryColor, fontWeight: FontWeight.bold, fontSize: 20)),
//         // isLoading
//         //     ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2))
//         //     : TextButton(onPressed: onSave, child: const Text('Save', style: TextStyle(color: AppColors.handleColor, fontWeight: FontWeight.bold, fontSize: 15))),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:teachers_dashboard/core/utils/app_colors.dart';

class AppBarCreateExam extends StatelessWidget {
 
  final bool isLoading;

  const AppBarCreateExam({super.key, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: isLoading ? null : () => Navigator.pop(context),
        ),
        const SizedBox(width: 30),
        Text("Create New Exam",
            style: TextStyle(color: AppColors.darkPrimaryColor, fontWeight: FontWeight.bold, fontSize: 20)),
            SizedBox(width: 60),
      ],
    );
  }
}
