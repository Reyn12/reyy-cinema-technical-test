import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reyy_cinema/features/products/bloc/products_cubit.dart';
import 'package:reyy_cinema/features/products/bloc/products_state.dart';
import 'package:reyy_cinema/helper/dialog_error_helper.dart';
import 'package:reyy_cinema/widget/custom_snackbar.dart';

import '../../../helper/format_currency_helper.dart';
import '../../../routes/app_paths.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductsCubit(),
      child: const _ProductsView(),
    );
  }
}

class _ProductsView extends StatelessWidget {
  const _ProductsView();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        if (state is ProductsFailure) {
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
          appBar: AppBar(title: const Text('Daftar Produk')),
          body: RefreshIndicator(
            onRefresh: () => context.read<ProductsCubit>().load(),
            child: switch (state) {
              ProductsInitial() || ProductsLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
              ProductsFailure() => ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: const [SizedBox(height: 300)],
              ),
              ProductsLoaded(:final products) => products.isEmpty
                  ? ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: const [
                        SizedBox(height: 220),
                        Center(child: Text('Produk kosong')),
                      ],
                    )
                  : ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: products.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 8),
                      padding: const EdgeInsets.all(12),
                      itemBuilder: (context, i) {
                        final p = products[i];
                        return Card(
                          child: ListTile(
                            onTap: () => context.push(
                              AppPaths.productDetailWithId(p.id),
                            ),
                            title: Text(p.name),
                            subtitle: Text(
                              'Harga: ${formatRupiah(p.price)}',
                            ),
                            trailing: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(999),
                              ),
                              child: Text(
                                'Stok: ${p.stock}',
                                style: TextStyle(
                                  color: Colors.blue.shade900,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            },
          ),
        );
      },
    );
  }
}
