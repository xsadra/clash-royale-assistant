import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart' hide Paint;

class CardsChartData {
  final String category;
  final int cost;

  const CardsChartData(this.category, this.cost);
}

class CardsChart extends StatefulWidget {
  const CardsChart({Key key, @required this.chartData}) : super(key: key);
  final List<CardsChartData> chartData;

  @override
  _CardsChartState createState() => _CardsChartState();
}

class _CardsChartState extends State<CardsChart> {
  @override
  Widget build(BuildContext context) {
    var chartData = widget.chartData;
    final _colorPalettes =
        charts.MaterialPalette.getOrderedPalettes(chartData.length);
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        SizedBox(
          height: 200,
          child: charts.PieChart(
            // Pie chart can only render one series.
            /*seriesList=*/
            [
              charts.Series<CardsChartData, String>(
                id: 'Sales-1',
                colorFn: (_, idx) => _colorPalettes[idx].shadeDefault,
                domainFn: (CardsChartData sales, _) => sales.category,
                measureFn: (CardsChartData sales, _) => sales.cost,
                data: chartData,
                labelAccessorFn: (CardsChartData row, _) =>
                    '${row.category}: ${row.cost}',
              ),
            ],
            animate: true,
            defaultRenderer: charts.ArcRendererConfig(
              arcRatio: 0.4,
              // arcRendererDecorators: [
              //   charts.ArcLabelDecorator(
              //       labelPosition: charts.ArcLabelPosition.auto)
              // ],
            ),
            behaviors: [
              charts.ChartTitle(
                'All Cards',
                behaviorPosition: charts.BehaviorPosition.bottom,
              ),
              charts.DatumLegend(
                position: charts.BehaviorPosition.end,
                horizontalFirst: false,
                cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                showMeasures: true,
                legendDefaultMeasure: charts.LegendDefaultMeasure.sum,
                // measureFormatter: (num value) {
                //   return value == null ? '-' : ':${value}';
                // },
                //desiredMaxRows: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}