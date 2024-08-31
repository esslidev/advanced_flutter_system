import '../../../core/resources/data_state.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<DataState<UserEntity>> getUser({
    required String accessToken,
  });
}
