import 'package:foodmagic/services/repository.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setUp() {
  getIt.registerLazySingleton<Repository>(() => Repository());
}
