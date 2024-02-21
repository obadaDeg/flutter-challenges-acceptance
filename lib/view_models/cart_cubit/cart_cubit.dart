import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges_acceptance/models/product_item_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState([]));

  void safeEmit(CartState newState) {
    if (!isClosed) {
      emit(newState);
    }
  }
void addToCart(ProductItemModel product) {
    var existingItemIndex = state.cartItems.indexWhere(
        (item) => item.id == product.id && item.size == product.size);

    if (existingItemIndex != -1) {
      var existingItem = state.cartItems[existingItemIndex];
      existingItem.quantity += product
          .quantity; // Update the quantity based on the added product's quantity
      safeEmit(CartState(List.from(state.cartItems)));
    } else {
      safeEmit(CartState(List.from(state.cartItems)..add(product)));
    }
  }


  // Implement safeEmit in other methods similarly
  void removeFromCart(String productId) {
    safeEmit(CartState(
        state.cartItems..removeWhere((item) => item.id == productId)));
  }

  void toggleSelection(String productId) {
    var product = state.cartItems.firstWhere((item) => item.id == productId);
    product.isSelected = !product.isSelected;
    safeEmit(CartState(List.from(state.cartItems)));
  }

  void incrementQuantity(String productId) {
    var product = state.cartItems.firstWhere((item) => item.id == productId);
    product.quantity++;
    safeEmit(CartState(List.from(state.cartItems)));
  }

  void decrementQuantity(String productId) {
    var product = state.cartItems.firstWhere((item) => item.id == productId);
    if (product.quantity > 1) {
      product.quantity--;
      safeEmit(CartState(List.from(state.cartItems)));
    }
  }

  

  calculateTotalPrice() {}
}


