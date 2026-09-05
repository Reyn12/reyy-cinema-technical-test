import '../models/profile_model.dart';

class ProfileState {
  const ProfileState({
    this.profile,
    this.isLoading = false,
    this.hasError = false,
  });

  final ProfileModel? profile;
  final bool isLoading;
  final bool hasError;

  ProfileState copyWith({
    ProfileModel? profile,
    bool? isLoading,
    bool? hasError,
  }) {
    return ProfileState(
      profile: profile ?? this.profile,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
    );
  }
}
