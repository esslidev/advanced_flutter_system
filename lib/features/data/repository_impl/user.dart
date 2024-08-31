import 'dart:io';

import 'package:dio/dio.dart';

import '../../../core/constants/shared_preference_keys.dart';
import '../../../core/resources/data_state.dart';
import '../../../core/util/api_util.dart';
import '../../../core/util/prefs_util.dart';
import '../../domain/entities/user.dart';
import '../../domain/repository/user.dart';
import '../data_sources/remote/auth_api_service.dart';
import '../data_sources/remote/user_api_service.dart';

class UserRepositoryImpl implements UserRepository {
  final AuthApiService _authApiService;
  final UserApiService _userApiService;

  UserRepositoryImpl(this._authApiService, this._userApiService);

  @override
  Future<DataState<UserEntity>> getUser({
    required String accessToken,
  }) async {
    try {
      final httpResponse = await ApiUtil.autoAccessRenewal(
        _authApiService,
        () => _userApiService.getUser(
          accessToken: PrefsUtil.getString(PrefsKeys.userAccessToken)!,
        ),
      );

      print('http response >> ${httpResponse.data.data}');

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      print('catched error >> ${e.toString()}');
      return DataFailed(e);
    }
  }
}
