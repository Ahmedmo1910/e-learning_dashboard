import 'package:dio/dio.dart';
import 'package:teachers_dashboard/core/services/dio_client.dart';
import 'package:teachers_dashboard/features/teachers/data/attendence_model.dart';
import 'package:teachers_dashboard/features/teachers/data/grade_model.dart';

class TecherRepo {
  final DioClient _dioClient = DioClient();
  Future<dynamic> getTeacherSubjectsOfCurrentTeacher() async {
    try {
      final response = await _dioClient.dio.get(
        '/api/Teachers/TeacherSubjectsOfCurrentTeacher',
      );
      return response.data;
    } on DioException catch (e) {
      return e.response?.data['message'] ??
          'Failed to get Teacher Subjects Of Current Teacher';
    }
  }

  Future<dynamic> getTeacherSubjectLessonsAttachmentsByCurrentTeache({
    required String teacherSubjectId,
  }) async {
    try {
      final response = await _dioClient.dio.get(
        '/api/Teachers/TeacherSubjectLessonsAttachmentsByCurrentTeacher',
        queryParameters: {'teacherSubjectId': teacherSubjectId},
      );
      return response.data;
    } on DioException catch (e) {
      return e.response?.data['message'] ??
          'Failed to get lessons + attachments';
    }
  }

  Future<dynamic> getTeacherSubjectsByTeacherId({
    required String teacherId,
  }) async {
    try {
      final responce = await _dioClient.dio.get(
        '/api/Teachers/TeacherSubjectsByTeacherId',
        queryParameters: {'teacherId': teacherId},
      );
      return responce.data;
    } on DioException catch (e) {
      return e.response?.data['message'] ?? "Failed to load teacher subjects";
    }
  }

  Future<dynamic> getStudentsInClassroom({required String classroomId}) async {
    try {
      final response = await _dioClient.dio.get(
        '/api/Teachers/GetStudentsInClassroomByClassroomId',
        queryParameters: {'classroomId': classroomId},
      );
      return response.data;
    } on DioException catch (e) {
      return e.response?.data['message'] ??
          'Failed to get Students In Classroom';
    }
  }

  Future<dynamic> createLesson({
    required String lessontitle,
    required String lessondescription,
    required int sort,
    required String teachersubjectid,
  }) async {
    try {
      final responce = await _dioClient.dio.post(
        '/api/Teachers/CreateLesson',
        data: {
          'lessontitle': lessontitle,
          'lessondescription': lessondescription,
          'sort': sort,
          'teachersubjectid': teachersubjectid,
        },
      );
      return responce.data;
    } on DioException catch (e) {
      return e.response?.data["message"] ?? "Failed to create lesson";
    }
  }

  Future<dynamic> updateLesson({
    required String id,
    required String lessonTitle,
    required String lessonDescription,
    required int sort,
    required String teacherSubjectId,
  }) async {
    try {
      final responce = await _dioClient.dio.put(
        '/api/Teachers/UpdateLesson',
        data: {
          "id": id,
          "lessontitle": lessonTitle,
          "lessondescription": lessonDescription,
          "sort": sort,
          "teachersubjectid": teacherSubjectId,
        },
      );
      return responce.data;
    } on DioException catch (e) {
      return e.response?.data["message"] ?? "Failed to update lesson";
    }
  }

  Future<dynamic> deleteLesson({required String lessonId}) async {
    try {
      final responce = await _dioClient.dio.delete(
        '/api/Teachers/DeleteLesson',
        queryParameters: {'lessonId': lessonId},
      );
      return responce.data;
    } on DioException catch (e) {
      return e.response?.data["message"] ?? "Failed to delete lesson";
    }
  }

  Future<dynamic> createAttachment({
    required String teacherSubjectLessonId,
    required String attachment,
    required String attachmentUrl,
    required String attachmentTitle,
    required String attachmentDescription,
  }) async {
    try {
      final responce = await _dioClient.dio.post(
        '/api/Teachers/CreateAttachment',
        data: {
          "teachersubjectlessonid": teacherSubjectLessonId,
          "attachment": attachment,
          "attachmenturl": attachmentUrl,
          "attachmenttitle": attachmentTitle,
          "attachmentdescription": attachmentDescription,
        },
      );
      return responce.data;
    } on DioException catch (e) {
      return e.response?.data["message"] ?? "Failed to create attachment";
    }
  }

  Future<dynamic> deleteAttachment({required String attachmentId}) async {
    try {
      final responce = await _dioClient.dio.delete(
        '/api/Teachers/DeleteAttachment',
        queryParameters: {'attachmentId': attachmentId},
      );
      return responce.data;
    } on DioException catch (e) {
      return e.response?.data["message"] ?? "Failed to delete attachment";
    }
  }

  Future<dynamic> submitAttendance({
    required List<AttendanceModel> attendanceList,
  }) async {
    try {
      final body = attendanceList.map((e) => e.toJson()).toList();
      final response = await _dioClient.dio.post(
        '/api/Teachers/attendance/batch',
        data: body,
      );
      return response.data;
    } on DioException catch (e) {
      return e.response?.data["message"] ?? "Failed to submit attendance ";
    }
  }

  Future<dynamic> submitGrades({required List<GradeModel> gradesList}) async {
    try {
      final body = gradesList.map((e) => e.toJson()).toList();
      final response = await _dioClient.dio.post(
        '/api/Teachers/grades/batch',
        data: body,
      );
      return response.data;
    } on DioException catch (e) {
      return e.response?.data["message"] ?? "Failed to submit grades";
    }
  }
}
