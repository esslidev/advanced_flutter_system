import 'package:flutter/material.dart';

import '../../../../core/util/localization_service.dart';
import '../../../../core/util/responsive_screen_adapter.dart';
import '../../../../core/util/responsive_size_adapter.dart';
import '../../../../locator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
// responsive px adapter
  late ResponsiveSizeAdapter R;

  final LocalizationService localizationService =
      locator<LocalizationService>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    R = ResponsiveSizeAdapter(context);

    return Scaffold(
        body: ResponsiveScreenAdapter(
      defaultScreen: _buildDesktop(context),
      screenMobile: _buildDesktop(context),
    ));
  }

  Widget _buildDesktop(BuildContext context) {
    return Center(child: Text('desktop'));
  }
}
