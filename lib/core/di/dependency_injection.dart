import 'package:get_it/get_it.dart';
import 'package:hungry_app/features/login/data/repos/login_repo.dart';
import 'package:hungry_app/features/login/manager/login_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../networking/api_services.dart';
import '../networking/dio_client.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  /// Dio & ApiServices
  getIt.registerLazySingleton<DioClient>(() => DioClient());
  getIt.registerLazySingleton<ApiServices>(
    () => ApiServices(dioClient: getIt()),
  );

  /// SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  /// Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
}
