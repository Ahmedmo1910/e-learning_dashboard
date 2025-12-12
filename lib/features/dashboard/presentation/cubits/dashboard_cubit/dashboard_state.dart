part of 'dashboard_cubit.dart';

class DashboardState {
  final bool loading;
  final Map<String, dynamic>? profile;
  final List<dynamic>? stats;
  final List<dynamic>? quickAccess;
  final String? error;

  DashboardState({
    this.loading = false,
    this.profile,
    this.stats,
    this.quickAccess,
    this.error,
  });

  DashboardState copyWith({
    bool? loading,
    Map<String, dynamic>? profile,
    List<dynamic>? stats,
    List<dynamic>? quickAccess,
    String? error,
  }) {
    return DashboardState(
      loading: loading ?? this.loading,
      profile: profile ?? this.profile,
      stats: stats ?? this.stats,
      quickAccess: quickAccess ?? this.quickAccess,
      error: error ?? this.error,
    );
  }
}
