import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../bloc/auth_bloc/auth_bloc.dart';
import '../../bloc/customer_bloc/customer_bloc.dart';
import '../../bloc/inventory_bloc/inventory_bloc.dart';
import '../../bloc/product_bloc/product_bloc.dart';
import '../../bloc/purchase_order_bloc/purchase_order_bloc.dart';
import '../../bloc/supplier_bloc/supplier_bloc.dart';
import '../../repositories/auth_repository.dart';
import '../../repositories/customer_repository.dart';
import '../../repositories/inventory_repository.dart';
import '../../repositories/product_repository.dart';
import '../../repositories/purchase_order_repository.dart';
import '../../repositories/sales_order_reposiroty.dart';
import '../../repositories/supplier_repository.dart';
import '../store/local_storage.dart';

final getIt = GetIt.instance;
Future<void> setupLocator() async {
  // Core
  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio(BaseOptions(
      baseUrl: 'http://192.168.50.139:8080/api',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Add auth token if available
        final token = getIt<LocalStorage>().getToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
    ));

    return dio;
  });

  // Local Storage
  getIt.registerLazySingleton<LocalStorage>(() => LocalStorageImpl());

  // Repositories
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(getIt<Dio>()));
  getIt.registerLazySingleton<ProductRepository>(() => ProductRepository(getIt<Dio>()));
  getIt.registerLazySingleton<SalesOrderRepository>(() => SalesOrderRepository(getIt<Dio>()));
  getIt.registerLazySingleton<PurchaseOrderRepository>(() => PurchaseOrderRepository(getIt<Dio>()));
  getIt.registerLazySingleton<CustomerRepository>(() => CustomerRepository(getIt<Dio>()));
  getIt.registerLazySingleton<SupplierRepository>(() => SupplierRepository(getIt<Dio>()));
  getIt.registerLazySingleton<InventoryRepository>(() => InventoryRepository(getIt<Dio>()));

  // Blocs
  getIt.registerFactory(() => AuthBloc(getIt<AuthRepository>()));
  getIt.registerFactory(() => ProductBloc(getIt<ProductRepository>()));
  // getIt.registerFactory(() => SalesOrderBloc(getIt<SalesOrderRepository>()));
  getIt.registerFactory(() => PurchaseOrderBloc(getIt<PurchaseOrderRepository>()));
  // getIt.registerFactory(() => CustomerBloc(getIt<CustomerRepository>()));
  // getIt.registerFactory(() => SupplierBloc(getIt<SupplierRepository>()));
  getIt.registerFactory(() => InventoryBloc(getIt<InventoryRepository>()));
}

