import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class WindowsLayout extends StatefulWidget {
  const WindowsLayout({Key? key}) : super(key: key);

  @override
  _WindowsLayoutState createState() => _WindowsLayoutState();
}

typedef void VoidCallbackWithParam(dynamic value);

class _WindowsLayoutState extends State<WindowsLayout> {
  final TextEditingController _initialController = TextEditingController();
  final TextEditingController _monthlyController = TextEditingController();
  final TextEditingController _avYieldController = TextEditingController();
  final TextEditingController _avCapitalGainController =
      TextEditingController();
  final TextEditingController _timePeriodController = TextEditingController();
  double _initialInvestment = 1000;
  double _monthlyInvestment = 500;
  double _avYield = 8;
  double _avCapitalGain = 3;
  double _timePeriod = 5;
  late double _investedAmount;
  late double _totalInvestment;
  late double _result;
  late double i;

  @override
  void initState() {
    _initialController.text = _initialInvestment.toString();
    _monthlyController.text = _monthlyInvestment.toString();
    _avYieldController.text = _avYield.toString();
    _avCapitalGainController.text = _avCapitalGain.toString();
    _timePeriodController.text = _timePeriod.toString();

    _investedAmount =
        _initialInvestment + (_monthlyInvestment * 12) * _timePeriod;

    i = (_avYield + _avCapitalGain) / (12 * 100);

    _result = (_monthlyInvestment *
            (((pow((1 + i), (_timePeriod * 12))) - 1) / i) *
            (1 + i)) -
        _investedAmount;

    _totalInvestment = _investedAmount + _result;
    super.initState();
  }

  //FV = P × ((1 + i)n - 1) / i) × (1 + i)
  //

  void setStateCalculus(
      {dynamic initialInvestmant,
      dynamic monthlyInvestment,
      dynamic avYield,
      dynamic avCapitalGain,
      dynamic timePeriod}) {
    setState(() {
      initialInvestmant ??= _initialInvestment;
      monthlyInvestment ??= _monthlyInvestment;
      avYield ??= _avYield;
      avCapitalGain ??= _avCapitalGain;
      timePeriod ??= _timePeriod;

      _initialInvestment = initialInvestmant;
      _monthlyInvestment = monthlyInvestment;
      _avYield = avYield;
      _avCapitalGain = avCapitalGain;
      _timePeriod = timePeriod;

      _initialController.text = _initialInvestment.toStringAsFixed(0);
      _monthlyController.text = _monthlyInvestment.toStringAsFixed(0);
      _avYieldController.text = _avYield.toStringAsFixed(0);
      _avCapitalGainController.text = _avCapitalGain.toStringAsFixed(0);
      _timePeriodController.text = _timePeriod.toStringAsFixed(0);

      _investedAmount =
          _initialInvestment + (_monthlyInvestment * 12) * _timePeriod;
      i = (_avYield + _avCapitalGain) / (12 * 100);
      _result = (_monthlyInvestment *
              (((pow((1 + i), (_timePeriod * 12))) - 1) / i) *
              (1 + i)) -
          _investedAmount;
      _totalInvestment = _investedAmount + _result;
    });
  }

  List<Widget> _buildSlider(
      String label,
      TextEditingController controller,
      double min,
      double max,
      double valueToShow,
      VoidCallbackWithParam calculus,
      BuildContext context) {
    return [
      SizedBox(
        width: 350,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                label,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                width: 100,
                child: TextFormField(
                  controller: controller,
                  decoration: const InputDecoration(
                    fillColor: Color(0xffe5faf5),
                    filled: true,
                    contentPadding: EdgeInsets.only(left: 30),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
          width: 350,
          child: SfSliderTheme(
            data: SfSliderThemeData(
              activeTrackHeight: 5,
              inactiveTrackHeight: 5,
              activeTrackColor: const Color(0xff00d09c),
              inactiveTrackColor: Colors.black12,
              thumbColor: Colors.white,
              trackCornerRadius: 0,
              thumbRadius: 15,
            ),
            child: SfSlider(
                min: min, max: max, value: valueToShow, onChanged: calculus),
          ))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: <Widget>[
              ..._buildSlider(
                  'Intial investment',
                  _initialController,
                  0,
                  50000,
                  _initialInvestment,
                  (dynamic value) =>
                      {setStateCalculus(initialInvestmant: value)},
                  context),
              ..._buildSlider(
                  'Montly investment',
                  _monthlyController,
                  0,
                  50000,
                  _monthlyInvestment,
                  (dynamic value) =>
                      {setStateCalculus(monthlyInvestment: value)},
                  context),
              ..._buildSlider(
                  'Average Yield',
                  _avYieldController,
                  0,
                  100,
                  _avYield,
                  (dynamic value) => {setStateCalculus(avYield: value)},
                  context),
              ..._buildSlider(
                  'Average Capital gain',
                  _avCapitalGainController,
                  0,
                  100,
                  _avCapitalGain,
                  (dynamic value) => {setStateCalculus(avCapitalGain: value)},
                  context),
              ..._buildSlider(
                  'Years of investment',
                  _timePeriodController,
                  0,
                  50,
                  _timePeriod,
                  (dynamic value) => {setStateCalculus(timePeriod: value)},
                  context),
              const SizedBox(height: 50),
              SizedBox(
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text('Invested Amount'),
                      Text(
                        _investedAmount.toStringAsFixed(0),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text('Est. returns'),
                      Text(
                        _result.toStringAsFixed(0),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text('Total value'),
                      Text(
                        _totalInvestment.toStringAsFixed(0),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xFF98a4ff),
                    ),
                  ),
                  const SizedBox(width: 3),
                  const Text('Invested amount'),
                  const SizedBox(width: 30),
                  Container(
                    width: 20,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xFF5367ff),
                    ),
                  ),
                  const SizedBox(width: 3),
                  const Text('Estd. returns'),
                ],
              ),
              const SizedBox(height: 50),
              SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 30,
                    useRangeColorForAxis: true,
                    startAngle: 270,
                    endAngle: 270,
                    showLabels: false,
                    showTicks: false,
                    axisLineStyle: const AxisLineStyle(
                      thicknessUnit: GaugeSizeUnit.factor,
                      thickness: 0.35,
                      color: Color(0xFF98a4ff),
                    ),
                    ranges: <GaugeRange>[
                      GaugeRange(
                          startValue: 0,
                          endValue: 17,
                          color: const Color(0xFF98a4ff),
                          sizeUnit: GaugeSizeUnit.factor,
                          startWidth: 0.35,
                          endWidth: 0.35),
                      GaugeRange(
                          startValue: (_avYield + _avCapitalGain),
                          endValue: 30,
                          sizeUnit: GaugeSizeUnit.factor,
                          color: const Color(0xFF5367ff),
                          startWidth: 0.35,
                          endWidth: 0.35),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {},
                child: const Text('INVEST NOW'),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20.0),
                    primary: Colors.greenAccent,
                    textStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
