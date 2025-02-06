import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_erp/bloc/purchase_order_bloc/purchase_order_bloc.dart';

import 'create_purchase_order.dart';

class PurchaseOrderListScreen extends StatelessWidget {
  const PurchaseOrderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Purchase Orders'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocBuilder<PurchaseOrderBloc, PurchaseOrderState>(
        builder: (context, state) {
          if (state is PurchaseOrderLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PurchaseOrderLoaded) {
            return ListView.builder(
              itemCount: state.purchaseOrders.length,
              itemBuilder: (context, index) {
                final order = state.purchaseOrders[index];
                return ListTile(
                  title: Text('Order ID: ${order.id}'),
                  subtitle: Text('Total Amount: \$${order.totalAmount}'),
                );
              },
            );
          } else {
            return const Center(child: Text('Failed to load orders'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const CreatePurchaseOrderScreen()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
