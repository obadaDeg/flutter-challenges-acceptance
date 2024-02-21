import 'package:flutter_challenges_acceptance/models/cart_orders_model.dart';
import 'package:flutter_challenges_acceptance/models/product_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_details_state.dart';
class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  List<CartOrdersModel> cartItems = [];
  ProductSize? size;
  int counter = 1;

  ProductDetailsCubit() : super(ProductDetailsInitial());

  void getProductDetails(String productId) async {
    emit(ProductDetailsLoading());
    try {
      // Assuming dummyProducts is a predefined list of products
      final product = dummyProducts.firstWhere((product) => product.id == productId);
      emit(ProductDetailsLoaded(product));
    } catch (e) {
      emit(ProductDetailsError(e.toString()));
    }
  }

  void incrementCounter() {
    counter++;
    emit(QuantityChanged(counter));
  }

  void decrementCounter() {
    if (counter > 1) {
      counter--;
      emit(QuantityChanged(counter));
    }
  }

  void changeSize(ProductSize value) {
    size = value;
    emit(SizeChanged(size!));
  }

  void addToCart(ProductItemModel product) {
    if (size != null) {
      final cartOrder = CartOrdersModel(
        id: DateTime.now().toIso8601String(),
        product: product,
        totalPrice: counter * product.price,
        quantity: counter,
        size: size!,
      );
      cartItems.add(cartOrder);
      emit(AddedToCart(cartItems));
    } else {
      emit(AddToCartError("Please select a size before adding to cart."));
    }
  }
}
