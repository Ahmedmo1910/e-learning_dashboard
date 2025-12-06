import 'dart:convert';
import 'package:http/http.dart' as http;

class ExamApi {
  final String baseUrl;
  final String token;

  ExamApi({required this.baseUrl, required this.token});

  Future<void> createExam({
    required String teacherSubjectLessonId,
    required String attachment,
    required String attachmentUrl,
    required String attachmentTitle,
    required String attachmentDescription,
  }) async {
    final url = Uri.parse('$baseUrl/api/Teachers/CreateAttachment');

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({
        "teachersubjectlessonid": teacherSubjectLessonId,
        "attachment": attachment,
        "attachmenturl": attachmentUrl,
        "attachmenttitle": attachmentTitle,
        "attachmentdescription": attachmentDescription,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to create exam: ${response.body}");
    }
  }

  Future<void> deleteExam({required String attachmentId}) async {
    final url = Uri.parse(
        '$baseUrl/api/Teachers/DeleteAttachment?attachmentId=$attachmentId');

    final response = await http.delete(
      url,
      headers: {
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to delete exam: ${response.body}");
    }
  }
}