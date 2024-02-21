
part of 'cart_cubit.dart';
class CartState {
  final List<ProductItemModel> cartItems;

  CartState(this.cartItems);

  List<ProductItemModel> get selectedItems =>
      cartItems.where((item) => item.isSelected).toList();

  double get total =>
      selectedItems.fold(0, (sum, item) => sum + item.price * item.quantity);
}
