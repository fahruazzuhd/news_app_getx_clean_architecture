import 'package:com.fahruazzuhd.newsapp/core/result.dart';
import 'package:get/get.dart';

enum ApiState { loading, failure, success }

mixin BaseController {
  Rx<ApiState> apiStatus = ApiState.loading.obs;
  Rx<String> errorMessage = "".obs;

  void _checkFailureOrSuccess(Result<bool> result) {
    if (result.error != null) {
      apiStatus.value = ApiState.failure;
      errorMessage.value = result.error!;
    } else {
      apiStatus.value = ApiState.success;
    }
  }

  Future<void> _apiOperationTemplate(Future<Result<bool>> apiCallback) async {
    apiStatus.value = ApiState.loading;
    try {
      Result<bool> result = await apiCallback;
      _checkFailureOrSuccess(result);
    } catch (e) {
      apiStatus.value = ApiState.failure;
      errorMessage.value = e.toString();
    }
  }

  Future<void> createItem(Future<Result<bool>> apiCallback) async {
    await _apiOperationTemplate(apiCallback);
  }

  Future<void> updateItem(Future<Result<bool>> apiCallback) async {
    await _apiOperationTemplate(apiCallback);
  }

  Future<void> deleteItem(Future<Result<bool>> apiCallback) async {
    await _apiOperationTemplate(apiCallback);
  }
}
