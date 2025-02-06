import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_erp/bloc/purchase_order_bloc/purchase_order_bloc.dart';
import 'package:flutter_simple_erp/models/purchase_order.dart';

class CreatePurchaseOrderScreen extends StatefulWidget {
  const CreatePurchaseOrderScreen({super.key});

  @override
  _CreatePurchaseOrderScreenState createState() =>
      _CreatePurchaseOrderScreenState();
}

class _CreatePurchaseOrderScreenState extends State<CreatePurchaseOrderScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userIdController = TextEditingController();
  final _supplierIdController = TextEditingController();
  final List<TextEditingController> _productIdControllers = [];
  final List<TextEditingController> _priceControllers = [];
  final List<TextEditingController> _quantityControllers = [];

  void _addProductField() {
    setState(() {
      _productIdControllers.add(TextEditingController());
      _priceControllers.add(TextEditingController());
      _quantityControllers.add(TextEditingController());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Purchase Order'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _userIdController,
                  decoration: const InputDecoration(labelText: 'User ID'),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  controller: _supplierIdController,
                  decoration: const InputDecoration(labelText: 'Supplier ID'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                ...List.generate(_productIdControllers.length, (index) {
                  return Column(
                    children: [
                      TextFormField(
                        controller: _productIdControllers[index],
                        decoration:
                            const InputDecoration(labelText: 'Product ID'),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        controller: _priceControllers[index],
                        decoration: const InputDecoration(labelText: 'Price'),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        controller: _quantityControllers[index],
                        decoration:
                            const InputDecoration(labelText: 'Quantity'),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                }),
                ElevatedButton(
                  onPressed: _addProductField,
                  child: const Text('Add Product'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final order = PurchaseOrder(
                        userId: int.parse(_userIdController.text),
                        supplierId: int.parse(_supplierIdController.text),
                        products: List.generate(
                            _productIdControllers.length,
                            (index) => PurchaseOrderItem(
                                  productId: int.parse(
                                      _productIdControllers[index].text),
                                  price: double.parse(
                                      _priceControllers[index].text),
                                  quantity: int.parse(
                                      _quantityControllers[index].text),
                                )),
                      );
                      context
                          .read<PurchaseOrderBloc>()
                          .add(CreateNewPurchaseOrder(order));
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Create Purchase Order'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
