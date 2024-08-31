import '../../domain/entities/credentials.dart';

class CredentialsModel extends CredentialsEntity {
  const CredentialsModel({
    super.accessToken,
    super.renewToken,
  });

  factory CredentialsModel.fromJson(Map<String, dynamic> json) {
    return CredentialsModel(
      accessToken: json['accessToken'],
      renewToken: json['renewToken'],
    );
  }
}
