import 'package:aara_app/services/api.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'model/aara_model.dart';

class LineChartWidget extends StatefulWidget {
  List<ChartData> chartData = [];
  LineChartWidget({Key? key, required this.chartData}) : super(key: key);

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  AaraModel? aaraModel;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    isLoading = true;
    aaraModel = await API.getAPI();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : SfCartesianChart(
            title: ChartTitle(
              // text: "widget.text",
              alignment: ChartAlignment.near,
              textStyle: const TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w300,
              ),
            ),
            enableAxisAnimation: true,
            primaryXAxis: CategoryAxis(
              desiredIntervals: 5,
              majorGridLines: const MajorGridLines(width: 1),
              interval: 1,
              labelRotation: 50,
              axisLine: const AxisLine(width: 1),
            ),
            selectionType: SelectionType.point,
            primaryYAxis: NumericAxis(
              axisLine: AxisLine(),
              anchorRangeToVisiblePoints: true,
              majorGridLines: MajorGridLines(width: 1),
              isVisible: true,
            ),
            series: <ChartSeries>[
              LineSeries<ChartData, String>(
                color: Colors.green,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                enableTooltip: true,
                isVisible: true,
                // splineType: SplineType.clamped,
                width: 1,
                markerSettings: const MarkerSettings(
                  isVisible: true,
                  color: Colors.green,
                  shape: DataMarkerType.circle,
                ),
                dataSource: widget.chartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
              ),
            ],
            backgroundColor: Colors.transparent,
            borderWidth: 0,
            plotAreaBorderWidth: 0,
          );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}
