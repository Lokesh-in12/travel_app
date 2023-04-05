import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:travel_app/core/themes/colors.dart';
import 'package:travel_app/src/models/chart_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late List<ChartModel> chartData;

  @override
  void initState() {
    super.initState();
    chartData = [
      ChartModel(day: 17, price: 21500),
      ChartModel(day: 18, price: 22684),
      ChartModel(day: 19, price: 21643),
      ChartModel(day: 20, price: 22997),
      ChartModel(day: 21, price: 22883),
      ChartModel(day: 22, price: 22635),
      ChartModel(day: 23, price: 23500),
      ChartModel(day: 24, price: 21534),
      ChartModel(day: 25, price: 22354),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile", style: Theme.of(context).textTheme.bodyLarge),
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Profile Visits",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Center(
                child: SfCartesianChart(
                  title: ChartTitle(
                      text: "Profile Visits",
                      textStyle: Theme.of(context).textTheme.displayMedium),
                  backgroundColor: black,
                  tooltipBehavior:
                      TooltipBehavior(color: lightGrey, enable: true),
                  margin: const EdgeInsets.all(10),
                  borderWidth: 0,
                  borderColor: transparent,
                  plotAreaBorderWidth: 0,
                  legend: Legend(
                    isVisible: true,
                    borderColor: ligthViolet,
                    position: LegendPosition.bottom,
                    iconHeight: 20,
                    toggleSeriesVisibility: true,
                    textStyle: const TextStyle(color: white),
                    shouldAlwaysShowScrollbar: true,
                    isResponsive: true,
                    itemPadding: 65,
                    alignment: ChartAlignment.near,
                  ),
                  primaryXAxis: NumericAxis(
                      minimum: 17,
                      maximum: 25,
                      isVisible: false,
                      borderWidth: 0,
                      borderColor: transparent),
                  primaryYAxis: NumericAxis(
                    minimum: 19000,
                    maximum: 25000,
                    interval: 1000,
                    isVisible: false,
                    borderWidth: 0,
                    borderColor: transparent,
                  ),
                  series: <ChartSeries<ChartModel, int>>[
                    SplineAreaSeries(
                      dataSource: chartData,
                      xValueMapper: (ChartModel data, _) => data.day,
                      yValueMapper: (ChartModel data, _) => data.price,
                      splineType: SplineType.natural,
                      gradient: LinearGradient(
                          colors: [
                            darkPurpleViolet,
                            darkPurpleViolet.withAlpha(150)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                    ),
                    SplineSeries(
                      dataSource: chartData,
                      color: ligthViolet.withAlpha(30),
                      width: 4,
                      isVisible: true,
                      markerSettings: const MarkerSettings(
                          color: transparent,
                          shape: DataMarkerType.circle,
                          borderWidth: 2,
                          isVisible: true,
                          borderColor: lightGrey),
                      xValueMapper: (ChartModel data, _) => data.day,
                      yValueMapper: (ChartModel data, _) => data.price,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
