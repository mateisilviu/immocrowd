import 'package:coownergeneration/core/util/responsive.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'mobile_layout.dart';
import 'windows_layout.dart';

class CalculatorWidget extends StatefulWidget {
  const CalculatorWidget({Key? key}) : super(key: key);

  @override
  State<CalculatorWidget> createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  double _labelSliderValue = 50;
  final bool _isDesktop = defaultTargetPlatform == TargetPlatform.windows ||
      defaultTargetPlatform == TargetPlatform.linux ||
      defaultTargetPlatform == TargetPlatform.macOS ||
      kIsWeb;

  @override
  Widget build(BuildContext context) {
    return _isDesktop ? const WindowsLayout() : const MobileLayout();
  }

  //@override
  Widget build2(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final Widget slider = ResponsiveWidget.isLargeScreen(context) == true
          ? _buildWebLayout()
          : _buildMobileLayout();
      return constraints.maxHeight > 325
          ? slider
          : SingleChildScrollView(child: SizedBox(height: 325, child: slider));
    });
  }

  Widget _buildWebLayout() {
    return Container(
      alignment: Alignment.center,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width >= 1000 ? 550 : 440,
        child: _buildMobileLayout(),
      ),
    );
  }

  Widget _buildMobileLayout() {
    final double padding = MediaQuery.of(context).size.width / 20.0;
    return Container(
        padding: EdgeInsets.fromLTRB(padding, 0, padding, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Calculate your future gain",
              textScaleFactor: 2,
            ),
            _sliderWithLabelCustomization(),
          ],
        ));
  }

  SfSliderTheme _sliderWithLabelCustomization() {
    return SfSliderTheme(
        data: SfSliderThemeData(),
        child: SfSlider(
          showLabels: true,
          interval: 20,
          max: 100.0,
          value: _labelSliderValue,
          onChanged: (dynamic values) {
            setState(() {
              _labelSliderValue = values as double;
            });
          },
          enableTooltip: true,
          numberFormat: NumberFormat('#'),
        ));
  }
}
