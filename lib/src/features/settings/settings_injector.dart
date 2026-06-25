import '../../container_injector.dart';
import '../../core/api/locale_provider.dart';
import 'data/repositories/settings_repository_impl.dart';
import 'data/services/settings_locale_provider.dart';
import 'domain/repositories/settings_repository.dart';
import 'presentation/cubit/settings_cubit.dart';

void initSettings() {
  sl.registerLazySingleton<SettingsRepository>(() => SettingsRepositoryImpl());
  sl.registerLazySingleton<SettingsCubit>(
    () => SettingsCubit(settingsRepository: sl<SettingsRepository>()),
  );
  sl.registerLazySingleton<LocaleProvider>(
    () => SettingsLocaleProviderImpl(settingsCubit: sl<SettingsCubit>()),
  );
}
