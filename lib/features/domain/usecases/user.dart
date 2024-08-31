import '../../../core/resources/data_state.dart';
import '../entities/user.dart';
import '../repository/user.dart';

class UserUseCases {
  final UserRepository repository;

  UserUseCases(this.repository);

  Future<DataState<UserEntity>> getUser({
    required String accessToken,
  }) async {
    return await repository.getUser(accessToken: accessToken);
  }
}
