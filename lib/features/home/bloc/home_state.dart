import 'package:reyy_cinema/features/home/mappers/film_mapper.dart';
import 'package:reyy_cinema/features/home/models/film_model.dart';
import 'package:reyy_cinema/features/home/models/home_banner_model.dart';
import 'package:reyy_cinema/features/home/models/home_promo_model.dart';
import 'package:reyy_cinema/features/home/models/home_sorotan_model.dart';
import 'package:reyy_cinema/shared/models/film_pilihan_model.dart';

class HomeState {
  const HomeState({
    this.userName = '',
    this.promo,
    this.banners = const [],
    this.sorotan,
    this.films = const [],
    this.filmCategories = const [],
    this.selectedFilmCategoryIndex = 0,
    this.isPromoLoading = false,
    this.isBannersLoading = false,
    this.isSorotanLoading = false,
    this.isFilmsLoading = false,
    this.hasPromoError = false,
    this.hasBannersError = false,
    this.hasSorotanError = false,
    this.hasFilmsError = false,
  });

  final String userName;
  final HomePromoModel? promo;
  final List<HomeBannerModel> banners;
  final HomeSorotanModel? sorotan;
  final List<FilmModel> films;
  final List<FilmPilihanCategoryModel> filmCategories;
  final int selectedFilmCategoryIndex;

  final bool isPromoLoading;
  final bool isBannersLoading;
  final bool isSorotanLoading;
  final bool isFilmsLoading;

  final bool hasPromoError;
  final bool hasBannersError;
  final bool hasSorotanError;
  final bool hasFilmsError;

  bool get isAnyLoading =>
      isPromoLoading ||
      isBannersLoading ||
      isSorotanLoading ||
      isFilmsLoading;

  bool get isInitialFilmsLoading =>
      isFilmsLoading && filmCategories.isEmpty;

  String? get selectedFilmCategoryId {
    if (filmCategories.isEmpty) return null;
    final index = selectedFilmCategoryIndex.clamp(0, filmCategories.length - 1);
    return filmCategories[index].id;
  }

  List<FilmPilihanItemModel> get filmPilihanItems => films.toFilmPilihanItems();

  List<String> get bannerImagePaths =>
      banners.map((banner) => banner.imagePath).toList();

  HomeState copyWith({
    String? userName,
    HomePromoModel? promo,
    List<HomeBannerModel>? banners,
    HomeSorotanModel? sorotan,
    List<FilmModel>? films,
    List<FilmPilihanCategoryModel>? filmCategories,
    int? selectedFilmCategoryIndex,
    bool? isPromoLoading,
    bool? isBannersLoading,
    bool? isSorotanLoading,
    bool? isFilmsLoading,
    bool? hasPromoError,
    bool? hasBannersError,
    bool? hasSorotanError,
    bool? hasFilmsError,
  }) {
    return HomeState(
      userName: userName ?? this.userName,
      promo: promo ?? this.promo,
      banners: banners ?? this.banners,
      sorotan: sorotan ?? this.sorotan,
      films: films ?? this.films,
      filmCategories: filmCategories ?? this.filmCategories,
      selectedFilmCategoryIndex:
          selectedFilmCategoryIndex ?? this.selectedFilmCategoryIndex,
      isPromoLoading: isPromoLoading ?? this.isPromoLoading,
      isBannersLoading: isBannersLoading ?? this.isBannersLoading,
      isSorotanLoading: isSorotanLoading ?? this.isSorotanLoading,
      isFilmsLoading: isFilmsLoading ?? this.isFilmsLoading,
      hasPromoError: hasPromoError ?? this.hasPromoError,
      hasBannersError: hasBannersError ?? this.hasBannersError,
      hasSorotanError: hasSorotanError ?? this.hasSorotanError,
      hasFilmsError: hasFilmsError ?? this.hasFilmsError,
    );
  }
}
