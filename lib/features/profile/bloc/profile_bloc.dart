import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reyy_cinema/network/api_service.dart';

import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({ApiService? apiService})
    : apiService = apiService ?? sharedApiService,
      super(const ProfileState(isLoading: true)) {
    on<ProfileLoadRequested>(onLoadRequested);
    add(const ProfileLoadRequested());
  }

  final ApiService apiService;

  Future<void> onLoadRequested(
    ProfileLoadRequested event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    try {
      final profile = await apiService.fetchProfile(mock: true);
      if (isClosed) return;
      emit(
        state.copyWith(
          profile: profile,
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
