import 'package:get_it/get_it.dart';
import 'package:teachers_dashboard/core/services/localization_provider.dart';

final GetIt getIt = GetIt.instance;

void setupGetIt() {
  // Localization Provider
  getIt.registerLazySingleton<LocalizationProvider>(
        () => LocalizationProvider(),
  );
}
