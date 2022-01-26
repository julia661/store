import 'package:chopper/chopper.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:test_app/services/api_service.dart';

import 'models/product.model.dart';

class AppState {
  AppState({
    required this.isLoading,
    required this.products,
  });

  final bool isLoading;
  final List<Product> products;

  factory AppState.initialState() => AppState(
        isLoading: true,
        products: <Product>[],
      );
}

class FetchProductsAction {
  final bool isLoading;
  final List<Product> products;

  FetchProductsAction(this.isLoading, this.products);
}

AppState reducer(AppState state, dynamic action) {
  if (action is FetchProductsAction) {
    return AppState(
      isLoading: action.isLoading,
      products: action.products,
    );
  } else {
    return state;
  }
}

ThunkAction<AppState> fetchProducts() => (Store<AppState> store) async {
      final ApiService apiService = ApiService.create();

      List<Product> products;
      bool isLoading;

      try {
        final Response response = await apiService.getProducts();
        products = response.body;
        isLoading = false;
      } catch (e) {
        print('Caught error: $e');
        return;
      }
      store.dispatch(FetchProductsAction(isLoading, products));
    };
