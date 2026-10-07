import 'package:fruits_hub_dashboard/core/services/stoarage_service.dart';
import 'package:fruits_hub_dashboard/core/services/supabase_stoarge.dart';
import 'package:get_it/get_it.dart';

import '../repos/images_repo/images_repo.dart';
import '../repos/images_repo/images_repo_impl.dart';
import '../repos/product_repo/product_repo.dart';
import '../repos/product_repo/product_repo_impl.dart';
import 'data_service.dart';
import 'firestore_service.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<StorageService>(SupaBaseStorgeService());
  getIt.registerSingleton<DatabaseService>(FireStoreService());

  getIt.registerSingleton<ImagesRepo>(
      ImagesRepoImpl(getIt.get<StorageService>()));
  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(
      getIt.get<DatabaseService>(),
    ),
  );

  // getIt.registerSingleton<OrdersRepo>(
  //     OrdersRepoImpl(getIt.get<DatabaseService>()));
}