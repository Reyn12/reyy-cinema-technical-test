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
    on<HomeFilmCategoryChanged>(onFilmCategoryChanged);
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
        selectedFilmCategoryIndex: 0,
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
            apiService.fetchFilms(mock: true, categoryId: 'all'),
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
        selectedFilmCategoryIndex: 0,
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

  Future<void> onFilmCategoryChanged(
    HomeFilmCategoryChanged event,
    Emitter<HomeState> emit,
  ) async {
    if (state.filmCategories.isEmpty) return;
    if (event.categoryIndex == state.selectedFilmCategoryIndex &&
        !state.isFilmsLoading) {
      return;
    }

    final index = event.categoryIndex.clamp(0, state.filmCategories.length - 1);
    final categoryId = state.filmCategories[index].id;

    emit(
      state.copyWith(
        selectedFilmCategoryIndex: index,
        isFilmsLoading: true,
        hasFilmsError: false,
      ),
    );

    try {
      final films = await apiService.fetchFilms(
        mock: true,
        categoryId: categoryId,
      );
      if (isClosed) return;
      emit(
        state.copyWith(
          films: films,
          isFilmsLoading: false,
          hasFilmsError: false,
        ),
      );
    } catch (_) {
      if (isClosed) return;
      emit(state.copyWith(isFilmsLoading: false, hasFilmsError: true));
    }
  }
}
