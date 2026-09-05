import 'package:dio/dio.dart';
import 'package:reyy_cinema/features/about_app/mocks/about_app_mocks.dart';
import 'package:reyy_cinema/features/about_app/models/about_app_model.dart';
import 'package:reyy_cinema/features/auth/mocks/auth_mocks.dart';
import 'package:reyy_cinema/features/faq/mocks/faq_mocks.dart';
import 'package:reyy_cinema/features/faq/models/faq_model.dart';
import 'package:reyy_cinema/features/profile/mocks/profile_mocks.dart';
import 'package:reyy_cinema/features/profile/models/profile_model.dart';
import 'package:reyy_cinema/features/reminder/mocks/reminder_mocks.dart';
import 'package:reyy_cinema/features/reminder/models/reminder_model.dart';
import 'package:reyy_cinema/features/terms/mocks/terms_mocks.dart';
import 'package:reyy_cinema/features/terms/models/terms_model.dart';
import 'package:reyy_cinema/network/environment.dart';

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
