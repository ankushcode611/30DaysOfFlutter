import 'package:test_lifecycle_statefulwidget/models/cart.dart';
import 'package:test_lifecycle_statefulwidget/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  CatalogModel catalog = CatalogModel();
  CartModel cart = CartModel()..catalog = CatalogModel();
}