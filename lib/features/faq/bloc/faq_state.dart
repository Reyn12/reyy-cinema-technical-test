import 'package:reyy_cinema/features/faq/models/faq_model.dart';

class FaqState {
  const FaqState({
    this.items = const [],
    this.isLoading = false,
    this.hasError = false,
  });

  final List<FaqItemModel> items;
  final bool isLoading;
  final bool hasError;

  FaqState copyWith({
    List<FaqItemModel>? items,
    bool? isLoading,
    bool? hasError,
  }) {
    return FaqState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
    );
  }
}
