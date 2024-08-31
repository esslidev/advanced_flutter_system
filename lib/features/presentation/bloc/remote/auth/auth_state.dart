import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/credentials.dart';

abstract class RemoteAuthState extends Equatable {
  final CredentialsEntity? credentials;
  final DioException? error;

  const RemoteAuthState({this.credentials, this.error});

  @override
  List<Object> get props => [credentials ?? '', error ?? ''];
}

// init user
class RemoteAuthInitial extends RemoteAuthState {
  const RemoteAuthInitial();
}

// loading user
class RemoteAuthSigningIn extends RemoteAuthState {
  const RemoteAuthSigningIn();
}

class RemoteAuthSignedIn extends RemoteAuthState {
  const RemoteAuthSignedIn(CredentialsEntity? credentials)
      : super(credentials: credentials);
}

class RemoteAuthError extends RemoteAuthState {
  const RemoteAuthError(DioException? error) : super(error: error);
}
