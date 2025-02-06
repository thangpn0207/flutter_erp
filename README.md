# Flutter ERP App

A Flutter-based ERP application that manages inventory, products, and purchase orders using **Flutter Bloc** for state management. This application integrates with a **Golang Backend** and follows **Material Design** principles.

## 📂 Project Structure

```
📦 project_root
├── 📂 bloc
│   ├── 📂 auth_bloc
│   ├── 📂 customer_bloc
│   ├── 📂 inventory_bloc
│   ├── 📂 product_bloc
│   ├── 📂 purchase_order_bloc
│   ├── 📂 supplier_bloc
│
├── 📂 core
│   ├── 📂 di (Dependency Injection)
│   ├── 📂 store (Local Storage Management)
│
├── 📂 features
│   ├── 📂 auth
│   ├── 📂 dashboard_screen
│   ├── 📂 inventory_screen
│   ├── 📂 product_manager
│   ├── 📂 purchase_order_screen
│
├── 📂 models (Data Models)
├── 📂 repositories (Data Repositories)
├── main.dart (Application Entry Point)
├── 📂 test (Unit & Widget Tests)
```

---

## ✨ Features

- **Authentication**
    - Login & Register using API
    - Token-based authentication

- **Inventory Management**
    - View inventory stock levels
    - Update inventory after purchase orders

- **Product Management**
    - Add/Edit/Delete products
    - View product details

- **Purchase Orders**
    - Create new purchase orders
    - Track purchase order status

---

## ⚙️ Backend Stack

- **Golang**: Backend service
- **MySQL**: Database
- **GORM**: ORM for database interaction

---

## 📦 Installation

1. **Clone the Repository**
   ```sh
   git clone https://github.com/your-repository/flutter-erp.git
   cd flutter-erp
   ```

2. **Install Dependencies**
   ```sh
   flutter pub get
   ```

3. **Run the App**
   ```sh
   flutter run
   ```

---

## 🏗️ State Management

The app uses **Flutter Bloc** for handling state.

### Example: Handling Purchase Order Bloc

```dart
class PurchaseOrderBloc extends Bloc<PurchaseOrderEvent, PurchaseOrderState> {
  final OrderRepository repository;

  PurchaseOrderBloc({required this.repository}) : super(PurchaseOrderInitial());

  @override
  Stream<PurchaseOrderState> mapEventToState(PurchaseOrderEvent event) async* {
    if (event is LoadPurchaseOrders) {
      yield PurchaseOrderLoading();
      try {
        final orders = await repository.fetchPurchaseOrders();
        yield PurchaseOrderLoaded(orders);
      } catch (e) {
        yield PurchaseOrderError(e.toString());
      }
    }
  }
}
```

---

## 📌 API Integration

The app interacts with the **Golang Backend API**.

### Example: Fetch Purchase Orders

```dart
Future<List<PurchaseOrder>> fetchPurchaseOrders() async {
  final response = await http.get(Uri.parse('$apiUrl/purchase_orders'));

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    return data.map((item) => PurchaseOrder.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load purchase orders');
  }
}
```

---

## 🛠️ Contribution

1. Fork the repository
2. Create a new branch (`feature-xyz`)
3. Commit your changes
4. Push to the branch
5. Open a pull request

---

## 📝 License
