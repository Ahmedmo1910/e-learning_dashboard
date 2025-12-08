class GradeModel {
  final String studentId;
  final String subjectId;
  final double gradeValue;
  final String gradeType;

  GradeModel({
    required this.studentId,
    required this.subjectId,
    required this.gradeValue,
    required this.gradeType,
  });

  Map<String, dynamic> toJson() {
    return {
      "studentid": studentId,
      "subjectid": subjectId,
      "gradevalue": gradeValue,
      "gradetype": gradeType,
    };
  }
}
