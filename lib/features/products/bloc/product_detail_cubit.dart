import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reyy_cinema/network/api_service.dart';

import 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit({
    required this.id,
    ApiService? apiService,
  }) : _apiService = apiService ?? sharedApiService,
       super(const ProductDetailInitial()) {
    load();
  }

  final int id;
  final ApiService _apiService;

  Future<void> load() async {
    emit(const ProductDetailLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      final product = await _apiService.fetchProductDetail(id, mock: true);
      if (isClosed) return;
      emit(ProductDetailLoaded(product));
    } catch (error) {
      if (isClosed) return;
      emit(ProductDetailFailure(error));
    }
  }
}
