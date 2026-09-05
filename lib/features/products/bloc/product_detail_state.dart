import '../models/product.dart';

sealed class ProductDetailState {
  const ProductDetailState();
}

class ProductDetailInitial extends ProductDetailState {
  const ProductDetailInitial();
}

class ProductDetailLoading extends ProductDetailState {
  const ProductDetailLoading();
}

class ProductDetailLoaded extends ProductDetailState {
  const ProductDetailLoaded(this.product);

  final Product product;
}

class ProductDetailFailure extends ProductDetailState {
  const ProductDetailFailure(this.error);

  final Object error;
}
