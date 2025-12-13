part of 'dashboard_cubit.dart';

class DashboardState {
  final bool loading;
  final Map<String, dynamic>? profile;
  final int studentsCount;
  final int classesCount;
  final List<dynamic>? stats;
  final List<dynamic>? quickAccess;
  final String? error;

  DashboardState({
    this.loading = false,
    this.profile,
    this.studentsCount = 0,
    this.classesCount = 0,
    this.stats,
    this.quickAccess,
    this.error,
  });

  DashboardState copyWith({
    bool? loading,
    Map<String, dynamic>? profile,
    int? studentsCount,
    int? classesCount,
    List<dynamic>? stats,
    List<dynamic>? quickAccess,
    String? error,
  }) {
    return DashboardState(
      loading: loading ?? this.loading,
      profile: profile ?? this.profile,
      studentsCount: studentsCount ?? this.studentsCount,
      classesCount: classesCount ?? this.classesCount,
      stats: stats ?? this.stats,
      quickAccess: quickAccess ?? this.quickAccess,
      error: error ?? this.error,
    );
  }
}
