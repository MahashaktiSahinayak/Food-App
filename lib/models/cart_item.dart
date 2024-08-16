import './item.dart';

class CartItem {
  final Item item;
  double quantity;

  CartItem({required this.item, this.quantity = 1});
}
