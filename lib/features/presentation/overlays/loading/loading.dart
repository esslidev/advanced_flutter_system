import 'package:flutter/material.dart';

import '../../../../core/constants/app_theme.dart';
import '../../../../core/util/localization_service.dart';
import '../../../../core/util/responsive_screen_adapter.dart';
import '../../../../core/util/responsive_size_adapter.dart';
import '../../widgets/common/custom_field.dart';
import '../../widgets/common/custom_text.dart';

class LoadingOverlay {
  final BuildContext context;
  final LocalizationService localizationService;
  final String? loadingTitle;

  LoadingOverlay(
      {required this.context,
      required this.localizationService,
      this.loadingTitle});

  OverlayEntry? _overlayEntry;

  void show() {
    _overlayEntry = OverlayEntry(
      builder: (context) => Material(
        color: Colors.transparent,
        child: ResponsiveScreenAdapter(
          defaultScreen: _buildDialogMobile(),
          screenMobile: _buildDialogMobile(),
        ),
      ),
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  Widget _buildDialogMobile() {
    final ResponsiveSizeAdapter R = ResponsiveSizeAdapter(context);
    return CustomField(
        backgroundColor: Colors.black.withOpacity(0.6),
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IntrinsicHeight(
            child: CustomField(
              minHeight: R.size(150),
              backgroundColor: AppTheme.colors.whiteSolid,
              borderRadius: R.size(12),
              padding: EdgeInsets.symmetric(
                  vertical: R.size(40), horizontal: R.size(60)),
              shadowColor: AppTheme.colors.graySteel.withOpacity(0.2),
              shadowOffset: Offset(R.size(2), R.size(2)),
              shadowBlurRadius: 8,
              gap: R.size(6),
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      AppTheme.light.primary2), // Green progress indicator
                ),
                SizedBox(
                  height: R.size(12),
                ),
                CustomText(
                  text: 'Verdant lifestyle'.toUpperCase(),
                  fontSize: R.size(20),
                  fontWeight: FontWeight.w500,
                  color: AppTheme.colors.graySteel.withOpacity(0.5),
                  letterSpacing: R.size(2),
                ),
                CustomText(
                  text: loadingTitle ??
                      localizationService
                          .translate('loadingScreen.loading')
                          .toUpperCase(),
                  fontSize: R.size(26),
                  fontWeight: FontWeight.w600,
                  letterSpacing: R.size(2),
                ),
              ],
            ),
          ),
        ]);
  }
}
