import 'package:get_it/get_it.dart';

import 'repository.dart';

final GetIt getIt = GetIt.instance;

void setUp() {
  getIt.registerLazySingleton<Repository>(() => Repository());
}
