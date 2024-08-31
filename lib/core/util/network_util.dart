import 'package:connectivity_plus/connectivity_plus.dart';

import '../../locator.dart';
import 'localization_service.dart';

class NetworkUtil {
  static final LocalizationService _localizationService =
      locator<LocalizationService>();

  static Future<void> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      throw {
        "title": _localizationService.translate('errors.networkError.title'),
        "message":
            _localizationService.translate('errors.networkError.message'),
      };
    }
  }
}
