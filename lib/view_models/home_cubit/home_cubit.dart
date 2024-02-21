import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges_acceptance/models/product_item_model.dart';
import 'package:flutter_challenges_acceptance/models/announcement_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  bool _isClosed = false;

  HomeCubit() : super(HomeInitial());

  @override
  Future<void> close() {
    _isClosed = true;
    return super.close();
  }

  void safeEmit(HomeState state) {
    if (!_isClosed) {
      emit(state);
    }
  }

  void getHomeData() async {
    safeEmit(HomeLoading());
    try {
      final products = dummyProducts; 
      final announcements =
          dummyAnnouncements; 
      await Future.delayed(const Duration(seconds: 2));
      safeEmit(HomeLoaded(products, announcements));
    } catch (e) {
      safeEmit(HomeError(e.toString()));
    }
  }

  void toggleFavoriteStatus(ProductItemModel product) {
    final currentState = state;
    if (!_isClosed && currentState is HomeLoaded) {
      final products = currentState.products;
      final index = products.indexWhere((p) => p.id == product.id);
      if (index != -1) {
        products[index].isFavorited = !products[index].isFavorited;
        if (products[index].isFavorited) {
          Favorites.add(products[index]);
        } else {
          Favorites.removeWhere((p) => p.id == products[index].id);
        }
        safeEmit(HomeLoaded(List.from(products), currentState.announcements));
      }
    }
  }
}


