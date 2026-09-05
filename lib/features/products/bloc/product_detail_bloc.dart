import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reyy_cinema/network/api_service.dart';

import 'product_detail_event.dart';
import 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc({
    required this.id,
    ApiService? apiService,
  }) : apiService = apiService ?? sharedApiService,
       super(const ProductDetailInitial()) {
    on<ProductDetailLoadRequested>(onLoadRequested);
    add(const ProductDetailLoadRequested());
  }

  final int id;
  final ApiService apiService;

  Future<void> onLoadRequested(
    ProductDetailLoadRequested event,
    Emitter<ProductDetailState> emit,
  ) async {
    emit(const ProductDetailLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      final product = await apiService.fetchProductDetail(id, mock: true);
      if (isClosed) return;
      emit(ProductDetailLoaded(product));
    } catch (error) {
      if (isClosed) return;
      emit(ProductDetailFailure(error));
    }
  }
}
