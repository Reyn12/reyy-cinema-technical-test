import 'package:dio/dio.dart';
import 'package:reyy_cinema/features/about_app/mocks/about_app_mocks.dart';
import 'package:reyy_cinema/features/about_app/models/about_app_model.dart';
import 'package:reyy_cinema/features/auth/mocks/auth_mocks.dart';
import 'package:reyy_cinema/features/buy_ticket/mocks/buy_ticket_mocks.dart';
import 'package:reyy_cinema/features/buy_ticket/models/buy_ticket_schedules_result.dart';
import 'package:reyy_cinema/features/faq/mocks/faq_mocks.dart';
import 'package:reyy_cinema/features/faq/models/faq_model.dart';
import 'package:reyy_cinema/features/home/mocks/home_mocks.dart';
import 'package:reyy_cinema/features/home/models/film_model.dart';
import 'package:reyy_cinema/features/home/models/home_banner_model.dart';
import 'package:reyy_cinema/features/home/models/home_promo_model.dart';
import 'package:reyy_cinema/features/home/models/home_sorotan_model.dart';
import 'package:reyy_cinema/features/home/utils/film_dummy_injector.dart';
import 'package:reyy_cinema/features/profile/mocks/profile_mocks.dart';
import 'package:reyy_cinema/features/profile/models/profile_model.dart';
import 'package:reyy_cinema/features/reminder/mocks/reminder_mocks.dart';
import 'package:reyy_cinema/features/reminder/models/reminder_model.dart';
import 'package:reyy_cinema/features/seat_select/mocks/seat_select_mocks.dart';
import 'package:reyy_cinema/features/seat_select/models/seat_map_result.dart';
import 'package:reyy_cinema/features/terms/mocks/terms_mocks.dart';
import 'package:reyy_cinema/features/terms/models/terms_model.dart';
import 'package:reyy_cinema/helper/format_date_helper.dart';
import 'package:reyy_cinema/network/environment.dart';
import 'package:reyy_cinema/shared/models/film_pilihan_model.dart';

import '../features/auth/models/login_result.dart';
import '../features/products/models/product.dart';
import 'api/converter.dart';
import 'dio_client.dart';

ApiService? sharedApiServiceInstance;

ApiService get sharedApiService =>
    sharedApiServiceInstance ??= ApiService(buildDioClient());

class ApiService {
  ApiService(this.dio);

  final Dio dio;

  bool useMock([bool mock = false]) => mock || mockStatus;

  Future<List<Product>> fetchProducts({bool mock = false}) async {
    if (useMock(mock)) {
      await Future<void>.delayed(const Duration(milliseconds: 400));
      return const [];
    }

    final res = await dio.get('/products');
    return Converter.list(res.data, Product.fromJson);
  }

  Future<Product> fetchProductDetail(int id, {bool mock = false}) async {
    if (useMock(mock)) {
      await Future<void>.delayed(const Duration(milliseconds: 400));
      return Product(id: id, name: 'Mock Product', price: 0);
    }

    final res = await dio.get('/products/$id');
    return Converter.single(res.data, Product.fromJson);
  }

  Future<LoginResult> login({
    required String username,
    required String password,
    bool mock = false,
  }) async {
    if (useMock(mock)) {
      await Future<void>.delayed(const Duration(seconds: 1));
      return AuthMocks.login(username: username, password: password);
    }

    final res = await dio.post(
      '/auth/login',
      data: {'username': username, 'password': password},
    );

    return Converter.single(res.data, LoginResult.fromJson);
  }

  Future<ProfileModel> fetchProfile({bool mock = false}) async {
    if (useMock(mock)) {
      await Future<void>.delayed(const Duration(milliseconds: 600));
      return ProfileMocks.profile;
    }

    final res = await dio.get('/auth/profile');
    return Converter.single(res.data, ProfileModel.fromJson);
  }

  Future<HomePromoModel> fetchHomePromo({bool mock = false}) async {
    if (useMock(mock)) {
      await Future<void>.delayed(const Duration(milliseconds: 450));
      return HomeMocks.promo;
    }

    final res = await dio.get('/home/promo');
    return Converter.single(res.data, HomePromoModel.fromJson);
  }

  Future<List<HomeBannerModel>> fetchHomeBanners({bool mock = false}) async {
    if (useMock(mock)) {
      await Future<void>.delayed(const Duration(milliseconds: 500));
      return HomeMocks.banners;
    }

    final res = await dio.get('/home/banners');
    return Converter.list(res.data, HomeBannerModel.fromJson);
  }

  Future<HomeSorotanModel> fetchHomeSorotan({bool mock = false}) async {
    if (useMock(mock)) {
      await Future<void>.delayed(const Duration(milliseconds: 550));
      return HomeMocks.sorotan;
    }

    final res = await dio.get('/home/sorotan');
    final data = res.data;
    if (data is Map<String, dynamic>) {
      final filmJson = data['data'] is Map
          ? (data['data'] as Map).cast<String, dynamic>()
          : data;
      return HomeSorotanModel(film: FilmDummyInjector.fromSwapiJson(filmJson));
    }
    throw Exception('Unexpected sorotan response');
  }

  /// SWAPI: `GET /films/` → `{ count, next, previous, results }`
  Future<List<FilmModel>> fetchFilms({
    bool mock = false,
    String? categoryId,
  }) async {
    if (useMock(mock)) {
      await Future<void>.delayed(const Duration(milliseconds: 700));
      return HomeMocks.filmsByCategory(categoryId);
    }

    final res = await dio.get(
      '/films/',
      queryParameters: {
        if (categoryId != null && categoryId.isNotEmpty && categoryId != 'all')
          'category': categoryId,
      },
    );
    final data = res.data;
    if (data is! Map) {
      throw Exception('Unexpected films response');
    }

    final results = data['results'];
    if (results is! List) {
      throw Exception('Films response missing results');
    }

    return FilmDummyInjector.fromSwapiList(results);
  }

  Future<List<FilmPilihanCategoryModel>> fetchFilmCategories({
    bool mock = false,
  }) async {
    if (useMock(mock)) {
      await Future<void>.delayed(const Duration(milliseconds: 400));
      return HomeMocks.filmCategories;
    }

    final res = await dio.get('/films/categories');
    return Converter.list(res.data, FilmPilihanCategoryModel.fromJson);
  }

  Future<FilmModel> fetchFilmDetail(int id, {bool mock = false}) async {
    if (useMock(mock)) {
      await Future<void>.delayed(const Duration(milliseconds: 500));
      return HomeMocks.films.firstWhere(
        (film) => film.id == id,
        orElse: () => HomeMocks.films.first,
      );
    }

    final res = await dio.get('/films/$id/');
    final data = res.data;
    if (data is! Map) {
      throw Exception('Unexpected film detail response');
    }

    return FilmDummyInjector.fromSwapiJson(data.cast<String, dynamic>());
  }

  Future<BuyTicketSchedulesResult> fetchBuyTicketSchedules({
    required int filmId,
    required DateTime date,
    bool mock = false,
  }) async {
    if (useMock(mock)) {
      await Future<void>.delayed(const Duration(milliseconds: 600));
      return BuyTicketMocks.schedulesForDate(date);
    }

    final res = await dio.get(
      '/films/$filmId/schedules',
      queryParameters: {'date': formatDateKey(date)},
    );

    final data = res.data;

    if (data is! Map) {
      throw Exception('Unexpected schedules response');
    }
    final payload = data['data'] is Map
        ? (data['data'] as Map).cast<String, dynamic>()
        : data.cast<String, dynamic>();
    return BuyTicketSchedulesResult.fromJson(payload);
  }

  Future<SeatMapResult> fetchSeatMap({
    required String slotId,
    bool mock = false,
  }) async {
    if (useMock(mock)) {
      await Future<void>.delayed(const Duration(milliseconds: 500));
      return SeatSelectMocks.mapForSlot(slotId);
    }

    final res = await dio.get('/schedules/$slotId/seats');
    final data = res.data;

    if (data is! Map) {
      throw Exception('Unexpected seat map response');
    }
    final payload = data['data'] is Map
        ? (data['data'] as Map).cast<String, dynamic>()
        : data.cast<String, dynamic>();
    return SeatMapResult.fromJson(payload);
  }

  Future<List<ReminderModel>> fetchReminderList({bool mock = false}) async {
    if (useMock(mock)) {
      await Future<void>.delayed(const Duration(milliseconds: 400));
      return ReminderMocks.list;
    }

    final res = await dio.get('/reminders');
    return Converter.list(res.data, ReminderModel.fromJson);
  }

  Future<TermsModel> fetchTermsContent({bool mock = false}) async {
    if (useMock(mock)) {
      await Future<void>.delayed(const Duration(milliseconds: 400));
      return TermsMocks.content;
    }

    final res = await dio.get('/terms');
    return Converter.single(res.data, TermsModel.fromJson);
  }

  Future<List<FaqItemModel>> fetchFaqList({bool mock = false}) async {
    if (useMock(mock)) {
      await Future<void>.delayed(const Duration(milliseconds: 400));
      return FaqMocks.list;
    }

    final res = await dio.get('/faqs');
    return Converter.list(res.data, FaqItemModel.fromJson);
  }

  Future<AboutAppModel> fetchAboutAppContent({bool mock = false}) async {
    if (useMock(mock)) {
      await Future<void>.delayed(const Duration(milliseconds: 400));
      return AboutAppMocks.content;
    }

    final res = await dio.get('/about-app');
    return Converter.single(res.data, AboutAppModel.fromJson);
  }
}
