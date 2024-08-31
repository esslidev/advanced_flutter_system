import 'package:flutter/material.dart';

enum ScreenSize {
  mobile,
  tablet,
  desktop,
  largeDesktop,
}

class ResponsiveScreenAdapter extends StatelessWidget {
  final Widget? defaultScreen;
  final Widget? screenMobile;
  final Widget? screenTablet;
  final Widget? screenDesktop;
  final Widget? screenLargeDesktop;

  const ResponsiveScreenAdapter({
    super.key,
    this.defaultScreen,
    this.screenMobile,
    this.screenTablet,
    this.screenDesktop,
    this.screenLargeDesktop,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    ScreenSize screenSize = _getScreenSize(width);

    switch (screenSize) {
      case ScreenSize.mobile:
        return screenMobile ?? defaultScreen ?? _noScreenAvailable();
      case ScreenSize.tablet:
        return screenTablet ?? defaultScreen ?? _noScreenAvailable();
      case ScreenSize.desktop:
        return screenDesktop ?? defaultScreen ?? _noScreenAvailable();
      case ScreenSize.largeDesktop:
        return screenLargeDesktop ??
            screenDesktop ??
            defaultScreen ??
            _noScreenAvailable();
    }
  }

  ScreenSize _getScreenSize(double width) {
    if (width < 600) {
      return ScreenSize.mobile;
    } else if (width >= 600 && width < 1024) {
      return ScreenSize.tablet;
    } else if (width >= 1024 && width < 1440) {
      return ScreenSize.desktop;
    } else {
      return ScreenSize.largeDesktop;
    }
  }

  Widget _noScreenAvailable() {
    return const Center(child: Text('No screen available'));
  }
}
