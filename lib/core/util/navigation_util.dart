import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../constants/app_paths.dart';
import '../constants/shared_preference_keys.dart';
import 'prefs_util.dart';

class NavUtil {
  static void goToHomeScreen(
      BuildContext context, String accessToken, String renewToken) {
    PrefsUtil.setString(PrefsKeys.userAccessToken, accessToken);
    PrefsUtil.setString(PrefsKeys.userRenewToken, renewToken);
    Beamer.of(context).beamToNamed(AppPaths.routes.dashboardScreen);
  }
}
