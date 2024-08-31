import '../../../../data/models/user_model.dart';

abstract class RemoteUserEvent {
  const RemoteUserEvent();
}

class GetUser extends RemoteUserEvent {
  final String accessToken;

  const GetUser({
    required this.accessToken,
  });
}

class SetUser extends RemoteUserEvent {
  final UserModel user;

  SetUser(this.user);
}

class UpdateUser extends RemoteUserEvent {
  final UserModel user;

  UpdateUser(this.user);
}
