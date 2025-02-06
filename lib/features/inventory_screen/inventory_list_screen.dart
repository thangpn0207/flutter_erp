import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/inventory_bloc/inventory_bloc.dart';

class InventoryListScreen extends StatelessWidget {
  const InventoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocBuilder<InventoryBloc, InventoryState>(
        builder: (context, state) {
          if (state is InventoryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is InventoryLoaded) {
            return ListView.builder(
              itemCount: state.inventory.length,
              itemBuilder: (context, index) {
                final item = state.inventory[index];
                return ListTile(
                  title: Text('Product ID: ${item.productId}'),
                  subtitle: Text('Quantity: ${item.quantity}'),
                );
              },
            );
          } else {
            return const Center(child: Text('Failed to load inventory'));
          }
        },
      ),
    );
  }
}
