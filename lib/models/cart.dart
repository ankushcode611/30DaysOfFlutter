
// ignore_for_file: unnecessary_null_comparison

import 'package:test_lifecycle_statefulwidget/core/store.dart';
import 'package:test_lifecycle_statefulwidget/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // catalog field
  late CatalogModel _catalog;

  // collection of Ids - store Ids of each item
  final List<int> _itemIds = [];

  // get catalog
  CatalogModel get catalog => _catalog;


  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void remove(Item item) {}


}


class AddMutation extends VxMutation<MyStore>{
final Item item;
AddMutation(this.item);

@override
perform() {
    // TODO: implement perform
    store?.cart._itemIds.add(item.id.toInt());
  }

}

class RemoveMutation extends VxMutation<MyStore>{
final Item item;
RemoveMutation(this.item);

@override
perform() {
    // TODO: implement perform
    store?.cart._itemIds.remove(item.id.toInt());
  }

}