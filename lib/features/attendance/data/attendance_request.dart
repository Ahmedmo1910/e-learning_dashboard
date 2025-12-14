class AttendanceRequest {
  final String studentId;
  final String scheduleId;
  final DateTime date;
  final bool isPresent;
  final String notes;

  AttendanceRequest({
    required this.studentId,
    required this.scheduleId,
    required this.date,
    required this.isPresent,
    required this.notes,
  });

  Map<String, dynamic> toJson() {
    return {
      "studentid": studentId,
      "scheduleid": scheduleId,
      "date": date.toIso8601String(),
      "ispresent": isPresent,
      "notes": notes,
    };
  }
}
