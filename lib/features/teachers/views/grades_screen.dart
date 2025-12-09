import 'package:flutter/material.dart';
import 'package:teachers_dashboard/features/teachers/widgets/custom_button.dart';
import 'package:teachers_dashboard/features/teachers/widgets/grades_helper.dart';

class GradesScreen extends StatefulWidget {
  const GradesScreen({super.key});

  @override
  State<GradesScreen> createState() => _GradesScreenState();
}

class _GradesScreenState extends State<GradesScreen> {
  List students = [
    {"name": "Alex Johnson", "marks": 85},
    {"name": "Jordan Smith", "marks": 92},
    {"name": "Casey Brown", "marks": 78},
    {"name": "Morgan Lee", "marks": 45},
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xffF9F7F4),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Student Grades",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
      
                Row(
                  children: const [
                    Expanded(
                      child: Text(
                        "Student Name",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Marks",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Percentage",
                        style: TextStyle(fontSize: 13,fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        "Grade",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    
                  ],
                ),
      
                const SizedBox(height: 15),
      
                Expanded(
                  child: ListView.builder(
                    itemCount: students.length,
                    itemBuilder: (context, index) {
                      final student = students[index];
                      final marks = student["marks"];
                      final percent = marks;
                      final grade = GradesHelper.getGrade(marks);
      
                      return Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  student["name"],
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ),
      
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  child: TextFormField(
                                    initialValue: marks.toString(),
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.black12,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onChanged: (v) {
                                      setState(
                                        () => student["marks"] =
                                            int.tryParse(v) ?? 0,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(width: 40),
      
                              Expanded(
                                child: Text(
                                  "$percent%",
                                  style: TextStyle(
                                    color: GradesHelper.percentColor(percent),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
      
                              Expanded(
                                child: Text(
                                  grade,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: grade == "F"
                                        ? Colors.red
                                        : Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                        ],
                      );
                    },
                  ),
                ),
      
                const SizedBox(height: 10),
      
                CustomButton(text: "Save Grades", onClick: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


