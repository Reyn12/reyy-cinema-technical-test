import 'package:reyy_cinema/features/about_app/models/about_app_model.dart';

class AboutAppState {
  const AboutAppState({
    this.data,
    this.isLoading = false,
    this.hasError = false,
  });

  final AboutAppModel? data;
  final bool isLoading;
  final bool hasError;

  AboutAppState copyWith({
    AboutAppModel? data,
    bool? isLoading,
    bool? hasError,
  }) {
    return AboutAppState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
    );
  }
}
