// import 'package:flutter/material.dart';
// import 'package:teachers_dashboard/features/teachers/data/attendence_model.dart';
// import 'package:teachers_dashboard/features/teachers/widgets/custom_button.dart';
// import 'package:teachers_dashboard/features/teachers/widgets/status_button.dart';

// class AttendanceScreen extends StatefulWidget {
//   const AttendanceScreen({super.key});

//   @override
//   State<AttendanceScreen> createState() => _AttendanceScreenState();
// }

// class _AttendanceScreenState extends State<AttendanceScreen> {
//   List<AttendanceModel> attendanceList = [];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffF9F7F4),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "Student Attendance",
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),

//               const SizedBox(height: 20),

//               Expanded(
//                 child: ListView.builder(
//                   itemCount: attendanceList.length,
//                   itemBuilder: (context, index) {
//                     final student = attendanceList[index];
//                     // var status = student["status"];

//                     return Container(
//                       margin: const EdgeInsets.only(bottom: 10),
//                       padding: const EdgeInsets.all(20),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(18),
//                         boxShadow: [
//                           BoxShadow(color: Colors.black12, blurRadius: 4),
//                         ],
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Text(
//                                 student["name"],
//                                 style: const TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                               const Spacer(),
//                               Text(
//                                 "ID: ${student["id"]}",
//                                 style: TextStyle(
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.grey.shade700,
//                                 ),
//                               ),
//                             ],
//                           ),

//                           const SizedBox(height: 12),

//                           Row(
//                             children: [
//                               CStatusButton.statusButton(
//                                 label: "Present",
//                                 color: Colors.green,
//                                 isSelected: student["status"] == "Present",
//                                 onTap: () => setState(
//                                   () => student["status"] = "Present",
//                                 ),
//                               ),
//                               const SizedBox(width: 8),

//                               CStatusButton.statusButton(
//                                 label: "Late",
//                                 color: Colors.orange,
//                                 isSelected: student["status"] == "Late",
//                                 onTap: () =>
//                                     setState(() => student["status"] = "Late"),
//                               ),
//                               const SizedBox(width: 8),

//                               CStatusButton.statusButton(
//                                 label: "Absent",
//                                 color: Colors.red,
//                                 isSelected: student["status"] == "Absent",
//                                 onTap: () => setState(
//                                   () => student["status"] = "Absent",
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),

//               const SizedBox(height: 20),
//               CustomButton(text: "Save Attendance", onClick: () {}),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//   // import 'package:flutter/material.dart';
//   // import 'package:test_mega/features/teachers/attendance_item.dart';
//   // import 'package:test_mega/main_button.dart';

//   // class AttendanceScreen extends StatelessWidget {
//   //   const AttendanceScreen({super.key});

//   //   @override
//   //   Widget build(BuildContext context) {
//   //     final  students = [
//   //       {"id": 1, "name": "Alex Johnson"},
//   //       {"id": 2, "name": "Jordan Smith"},
//   //       {"id": 3, "name": "Casey Brown"},
//   //       {"id": 4, "name": "Morgan Lee"},
//   //     ];

//   //     return Scaffold(
//   //       backgroundColor: const Color(0xffF9F7F4),
//   //       body: SafeArea(
//   //         child: Padding(
//   //           padding: const EdgeInsets.all(20),
//   //           child: Column(
//   //             crossAxisAlignment: CrossAxisAlignment.start,
//   //             children: [
//   //               const Text(
//   //                 "Student Attendance",
//   //                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//   //               ),

//   //               const SizedBox(height: 20),

//   //               Expanded(
//   //                 child: ListView.separated(
//   //                   itemCount: students.length,
//   //                   separatorBuilder: (_, __) => const SizedBox(height: 15),
//   //                   itemBuilder: (context, index) {
//   //                     final s = students[index];
//   //                     return AttendanceItem(
//   //                       studentId:s['id'].toString() ,
//   //                       name: s["name"].toString(),
//   //                       onStatusChanged: (status) {
//   //                         // TODO: cubit.updateAttendance(id, status)
//   //                       },
//   //                     );
//   //                   },
//   //                 ),
//   //               ),

//   //               const SizedBox(height: 20),

//   //               MainButton(
//   //                 text: "Save Attendance",
//   //                 // onTap: () {
//   //                 //   // TODO: cubit.saveAttendance();
//   //                 // },
//   //               ),
//   //             ],
//   //           ),
//   //         ),
//   //       ),
//   //     );
//   //   }
//   // }

