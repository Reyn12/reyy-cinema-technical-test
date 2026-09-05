import 'package:flutter/material.dart';
import 'package:reyy_cinema/features/home/widgets/w_home_section_retry.dart';

/* Created by
   Reyy
   muhammadrenaldi687@gmail.com
*/

class StateView extends StatelessWidget {
  const StateView({
    super.key,
    required this.isLoading,
    required this.hasError,
    required this.child,
    this.isEmpty = false,
    this.loadingView,
    this.errorView,
    this.emptyView,
    this.onRetry,
    this.errorMessage = 'Gagal memuat data',
  });

  final bool isLoading;
  final bool hasError;
  final bool isEmpty;
  final Widget child;
  final Widget? loadingView;
  final Widget? errorView;
  final Widget? emptyView;
  final VoidCallback? onRetry;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return loadingView ??
          const Center(child: CircularProgressIndicator.adaptive());
    }

    if (hasError) {
      return errorView ??
          WHomeSectionRetry(message: errorMessage, onRetry: onRetry ?? () {});
    }

    if (isEmpty) {
      return emptyView ?? const SizedBox.shrink();
    }

    return child;
  }
}
