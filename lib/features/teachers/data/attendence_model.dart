class AttendanceModel {
  final String studentId;
  final String scheduleId;
  final bool isPresent;
  final String notes;
  String? date = "1986-10-06T10:17:21.222Z";
  AttendanceModel({
    required this.studentId,
    required this.scheduleId,
    required this.isPresent,
    required this.notes,
    this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      "studentid": studentId,
      "scheduleid": scheduleId,
      "ispresent": isPresent,
      "notes": notes,
      "date": date,
    };
  }
}
