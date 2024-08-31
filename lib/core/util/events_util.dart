import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/data/models/user_model.dart';
import '../../features/presentation/bloc/app/route/route_bloc.dart';
import '../../features/presentation/bloc/app/route/route_event.dart';
import '../../features/presentation/bloc/remote/auth/auth_bloc.dart';
import '../../features/presentation/bloc/remote/auth/auth_event.dart';
import '../../features/presentation/bloc/remote/user/user_bloc.dart';
import '../../features/presentation/bloc/remote/user/user_event.dart';
import '../constants/shared_preference_keys.dart';
import 'prefs_util.dart';

class EventsUtil {
  static RouteEvents get routeEvents => RouteEvents();
  static AuthEvents get authEvents => AuthEvents();
  static UserEvents get userEvents => UserEvents();
}

class RouteEvents {
  void updatePath(BuildContext context, String newPath) {
    context.read<AppRouteBloc>().add(UpdatePath(newPath));
  }
}

class AuthEvents {
  void signIn(BuildContext context, UserModel user) {
    context.read<RemoteAuthBloc>().add(SignIn(user));
  }
}

class UserEvents {
  void getUser(BuildContext context) {
    String? accessTokenPref = PrefsUtil.getString(PrefsKeys.userAccessToken);
    context.read<RemoteUserBloc>().add(GetUser(
          accessToken: accessTokenPref ?? '',
        ));
  }
}
