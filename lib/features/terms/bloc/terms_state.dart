import 'package:reyy_cinema/features/terms/models/terms_model.dart';

class TermsState {
  const TermsState({
    this.data,
    this.isLoading = false,
    this.hasError = false,
  });

  final TermsModel? data;
  final bool isLoading;
  final bool hasError;

  TermsState copyWith({
    TermsModel? data,
    bool? isLoading,
    bool? hasError,
  }) {
    return TermsState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
    );
  }
}
