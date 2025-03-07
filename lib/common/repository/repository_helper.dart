import 'package:com.fahruazzuhd.newsapp/common/network/dio_exceptions.dart';
import 'package:com.fahruazzuhd.newsapp/core/result.dart';
import 'package:dio/dio.dart';

// Kode ini adalah mixin di Dart yang berfungsi sebagai helper untuk menangani hasil API dengan error handling
mixin RepositoryHelper<T> {
  Future<Result<List<T>>> checkItemsFailOrSuccess(
      Future<List<T>> apiCallback) async {
    try {
      final List<T> items = await apiCallback;
      return Result.success(items); // ✅ Data berhasil
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Result.failure(errorMessage); // ❌ Error
    }
  }

  /// General helper untuk request API yang mengembalikan **model response (misal ArticleResult)**
  Future<Result<List<T>>> checkCustomItemsFailOrSuccess<R>(
    Future<R> apiCallback,
    List<T> Function(R response) getItemsCallback, // Mapper untuk ambil List<T>
  ) async {
    try {
      final R response = await apiCallback;
      final List<T> items = getItemsCallback(response); // Ambil data dari model
      return Result.success(items); // ✅ Data berhasil
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Result.failure(errorMessage); // ❌ Error
    }
  }

  Future<Result<bool>> checkItemFailOrSuccess(
      Future<bool> apiCallback, Function(dynamic response) param1) async {
    try {
      await apiCallback;
      return Result.success(true); // ✅ Berhasil
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Result.failure(errorMessage); // ❌ Error
    }
  }
}
