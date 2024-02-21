part of 'product_details_cubit.dart';

abstract class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsLoaded extends ProductDetailsState {
  final ProductItemModel product;

  ProductDetailsLoaded(this.product);
}

class ProductDetailsError extends ProductDetailsState {
  final String message;

  ProductDetailsError(this.message);
}

class AddingToCart extends ProductDetailsState {}

class AddedToCart extends ProductDetailsState {
  final List<CartOrdersModel> cartItems;

  AddedToCart(this.cartItems);
}

class AddToCartError extends ProductDetailsState {
  final String message;

  AddToCartError(this.message);
}

class QuantityChanged extends ProductDetailsState {
  final int quantity;

  QuantityChanged(this.quantity);
}

class SizeChanged extends ProductDetailsState {
  final ProductSize size;

  SizeChanged(this.size);
}
