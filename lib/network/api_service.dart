import 'package:dio/dio.dart';
import 'package:reyy_cinema/features/auth/mocks/auth_mocks.dart';
import 'package:reyy_cinema/features/reminder/mocks/reminder_mocks.dart';
import 'package:reyy_cinema/features/reminder/models/reminder_model.dart';
import 'package:reyy_cinema/network/environment.dart';

import '../features/auth/models/login_result.dart';
import '../features/products/models/product.dart';
import 'api/converter.dart';
import 'dio_client.dart';

ApiService? _sharedApiServiceInstance;

ApiService get sharedApiService =>
    _sharedApiServiceInstance ??= ApiService(buildDioClient());

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

  Future<List<ReminderModel>> fetchReminderList({
    bool mock = false,
  }) async {
    if (useMock(mock)) {
      await Future<void>.delayed(const Duration(milliseconds: 400));
      return ReminderMocks.list;
    }

    final res = await dio.get('/reminders');
    return Converter.list(res.data, ReminderModel.fromJson);
  }
}
