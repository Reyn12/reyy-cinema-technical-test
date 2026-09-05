import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:reyy_cinema/network/api_service.dart';

import 'about_app_event.dart';
import 'about_app_state.dart';

class AboutAppBloc extends Bloc<AboutAppEvent, AboutAppState> {
  AboutAppBloc({ApiService? apiService})
    : apiService = apiService ?? sharedApiService,
      super(const AboutAppState(isLoading: true)) {
    on<AboutAppLoadRequested>(onLoadRequested);
    add(const AboutAppLoadRequested());
  }

  final ApiService apiService;

  Future<void> onLoadRequested(
    AboutAppLoadRequested event,
    Emitter<AboutAppState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    try {
      final info = await PackageInfo.fromPlatform();
      final about = await apiService.fetchAboutAppContent(mock: true);
      if (isClosed) return;
      emit(
        state.copyWith(
          data: about.copyWith(version: info.version),
          isLoading: false,
          hasError: false,
        ),
      );
    } catch (_) {
      if (isClosed) return;
      emit(state.copyWith(isLoading: false, hasError: true));
    }
  }
}
