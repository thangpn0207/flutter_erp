import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_erp/bloc/inventory_bloc/inventory_bloc.dart';
import 'package:flutter_simple_erp/bloc/product_bloc/product_bloc.dart';
import 'package:flutter_simple_erp/bloc/purchase_order_bloc/purchase_order_bloc.dart';
import 'package:flutter_simple_erp/features/purchase_order_screen/purchase_order_list.dart';

import '../../bloc/auth_bloc/auth_bloc.dart';
import '../auth/login_screen.dart';
import '../inventory_screen/inventory_list_screen.dart';
import '../product_manager/product_list_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ERP Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              context.read<AuthBloc>().add(LogoutEvent());
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
      drawer: DashboardDrawer(),
      body: GridView.count(
        padding: EdgeInsets.all(16),
        crossAxisCount: 2,
        children: [
          _DashboardCard(
            title: 'Products',
            icon: Icons.inventory,
            onTap: () {
              context.read<ProductBloc>().add(LoadProducts());
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProductListScreen()),
              );

            },
          ),
          _DashboardCard(
            title: 'Sales Orders',
            icon: Icons.shopping_cart,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductListScreen()),
            ),
          ),
          _DashboardCard(
            title: 'Purchase Orders',
            icon: Icons.shopping_bag,
            onTap: () {
              context.read<PurchaseOrderBloc>().add(LoadPurchaseOrder());
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PurchaseOrderListScreen()),
              );

            },
          ),
          _DashboardCard(
            title: 'Inventory',
            icon: Icons.warehouse,
            onTap: () {
              context.read<InventoryBloc>().add(LoadInventory());
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const InventoryListScreen()),
              );

            },
          ),
          _DashboardCard(
            title: 'Customers',
            icon: Icons.people,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductListScreen()),
            ),
          ),
          _DashboardCard(
            title: 'Suppliers',
            icon: Icons.local_shipping,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductListScreen()),
            ),
          ),
        ],
      ),
    );
  }
}

class _DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _DashboardCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48),
            SizedBox(height: 8),
            Text(title, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}

// lib/widgets/dashboard_drawer.dart
class DashboardDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ERP System',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.inventory),
            title: Text('Products'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductListScreen()),
            ),
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Sales Orders'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductListScreen()),
            ),
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text('Purchase Orders'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PurchaseOrderListScreen()),
            ),
          ),
          ListTile(
            leading: Icon(Icons.warehouse),
            title: Text('Inventory'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InventoryListScreen()),
            ),
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Customers'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductListScreen()),
            ),
          ),
          ListTile(
            leading: Icon(Icons.local_shipping),
            title: Text('Suppliers'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductListScreen()),
            ),
          ),
        ],
      ),
    );
  }
}
