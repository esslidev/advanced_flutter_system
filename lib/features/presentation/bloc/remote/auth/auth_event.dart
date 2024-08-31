import '../../../../data/models/user_model.dart';

abstract class RemoteAuthEvent {
  const RemoteAuthEvent();
}

class SignUp extends RemoteAuthEvent {
  final UserModel user;

  const SignUp(this.user);
}

class SignIn extends RemoteAuthEvent {
  final UserModel user;

  const SignIn(this.user);
}
