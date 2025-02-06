import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth_bloc/auth_bloc.dart';
import 'bloc/inventory_bloc/inventory_bloc.dart';
import 'bloc/product_bloc/product_bloc.dart';
import 'bloc/purchase_order_bloc/purchase_order_bloc.dart';
import 'core/di/service_locator.dart';
import 'features/auth/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AuthBloc>()),
        BlocProvider(create: (context) => getIt<ProductBloc>()),
        // BlocProvider(create: (context) => getIt<SalesOrderBloc>()),
         BlocProvider(create: (context) => getIt<PurchaseOrderBloc>()),
        // BlocProvider(create: (context) => getIt<CustomerBloc>()),
        // BlocProvider(create: (context) => getIt<SupplierBloc>()),
         BlocProvider(create: (context) => getIt<InventoryBloc>()),
      ],
      child: MaterialApp(
        title: 'ERP System',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
