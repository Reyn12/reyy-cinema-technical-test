import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reyy_cinema/features/auth/storage/auth_storage.dart';
import 'package:reyy_cinema/features/home/models/film_model.dart';
import 'package:reyy_cinema/features/home/models/home_banner_model.dart';
import 'package:reyy_cinema/features/home/models/home_promo_model.dart';
import 'package:reyy_cinema/features/home/models/home_sorotan_model.dart';
import 'package:reyy_cinema/network/api_service.dart';
import 'package:reyy_cinema/shared/models/film_pilihan_model.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({ApiService? apiService, AuthStorage? authStorage})
    : apiService = apiService ?? sharedApiService,
      authStorage = authStorage ?? AuthStorage(),
      super(
        const HomeState(
          isPromoLoading: true,
          isBannersLoading: true,
          isSorotanLoading: true,
          isFilmsLoading: true,
        ),
      ) {
    on<HomeLoadRequested>(onLoadRequested);
    add(const HomeLoadRequested());
  }

  final ApiService apiService;
  final AuthStorage authStorage;

  Future<void> onLoadRequested(
    HomeLoadRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        isPromoLoading: true,
        isBannersLoading: true,
        isSorotanLoading: true,
        isFilmsLoading: true,
        hasPromoError: false,
        hasBannersError: false,
        hasSorotanError: false,
        hasFilmsError: false,
      ),
    );

    final user = await authStorage.getUser();

    HomePromoModel? promo = state.promo;
    List<HomeBannerModel> banners = state.banners;
    HomeSorotanModel? sorotan = state.sorotan;
    List<FilmModel> films = state.films;
    List<FilmPilihanCategoryModel> filmCategories = state.filmCategories;

    var hasPromoError = false;
    var hasBannersError = false;
    var hasSorotanError = false;
    var hasFilmsError = false;

    await Future.wait([
      () async {
        try {
          promo = await apiService.fetchHomePromo(mock: true);
        } catch (_) {
          hasPromoError = true;
        }
      }(),
      () async {
        try {
          banners = await apiService.fetchHomeBanners(mock: true);
        } catch (_) {
          hasBannersError = true;
        }
      }(),
      () async {
        try {
          sorotan = await apiService.fetchHomeSorotan(mock: true);
        } catch (_) {
          hasSorotanError = true;
        }
      }(),
      () async {
        try {
          final results = await Future.wait([
            apiService.fetchFilms(mock: true),
            apiService.fetchFilmCategories(mock: true),
          ]);
          films = results[0] as List<FilmModel>;
          filmCategories = results[1] as List<FilmPilihanCategoryModel>;
        } catch (_) {
          hasFilmsError = true;
        }
      }(),
    ]);

    if (isClosed) return;

    emit(
      state.copyWith(
        userName: user?.name ?? '',
        promo: promo,
        banners: banners,
        sorotan: sorotan,
        films: films,
        filmCategories: filmCategories,
        isPromoLoading: false,
        isBannersLoading: false,
        isSorotanLoading: false,
        isFilmsLoading: false,
        hasPromoError: hasPromoError,
        hasBannersError: hasBannersError,
        hasSorotanError: hasSorotanError,
        hasFilmsError: hasFilmsError,
      ),
    );
  }
}
