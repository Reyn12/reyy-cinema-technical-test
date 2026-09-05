import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reyy_cinema/features/products/bloc/product_detail_bloc.dart';
import 'package:reyy_cinema/features/products/bloc/product_detail_state.dart';
import 'package:reyy_cinema/helper/dialog_error_helper.dart';
import 'package:reyy_cinema/widget/custom_snackbar.dart';

import '../../../helper/format_currency_helper.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({
    required this.id,
    super.key,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductDetailBloc(id: id),
      child: const _ProductDetailView(),
    );
  }
}

class _ProductDetailView extends StatelessWidget {
  const _ProductDetailView();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductDetailBloc, ProductDetailState>(
      listener: (context, state) {
        if (state is ProductDetailFailure) {
          final parsed = parseDialogError(state.error);
          CustomSnackbar.error(
            context,
            parsed.message,
            title: parsed.title,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Detail Produk')),
          body: switch (state) {
            ProductDetailInitial() || ProductDetailLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
            ProductDetailFailure(:final error) => Center(
              child: Text('Gagal ambil detail: $error'),
            ),
            ProductDetailLoaded(:final product) => Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text('Harga: ${formatRupiah(product.price)}'),
                  Text('Stok: ${product.stock}'),
                  if (product.description != null) ...[
                    const SizedBox(height: 12),
                    Text(
                      product.description!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ],
              ),
            ),
          },
        );
      },
    );
  }
}
