import '../../../core/resources/data_state.dart';
import '../../data/models/user_model.dart';
import '../entities/credentials.dart';

abstract class AuthRepository {
  Future<DataState<CredentialsEntity>> signIn(UserModel user);
}
