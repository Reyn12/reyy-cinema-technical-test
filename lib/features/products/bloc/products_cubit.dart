import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reyy_cinema/network/api_service.dart';

import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit({ApiService? apiService})
    : _apiService = apiService ?? sharedApiService,
      super(const ProductsInitial()) {
    load();
  }

  final ApiService _apiService;

  Future<void> load() async {
    emit(const ProductsLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      final products = await _apiService.fetchProducts(mock: true);
      if (isClosed) return;
      emit(ProductsLoaded(products));
    } catch (error) {
      if (isClosed) return;
      emit(ProductsFailure(error));
    }
  }
}
