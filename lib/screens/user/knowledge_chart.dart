import 'package:cylink/models/Intelligence.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

class IntelligenceChart extends StatelessWidget {

  final GlobalKey<AnimatedCircularChartState> _chartKey =
  new GlobalKey<AnimatedCircularChartState>();

  final _chartSize = const Size( 150.0 , 150.0);

  List color = [Colors.green, Colors.orange, Colors.blue
  ];

  List<Intelligence> values = [
    Intelligence("Naturalist", 40, Colors.green),
    Intelligence("Musical", 50, Colors.green),
    Intelligence("Logial-Mathematical", 70, Colors.green),
    Intelligence("Existential", 60, Colors.green),
    Intelligence("Interpersonal", 25, Colors.green),
    Intelligence("Linguisic", 40, Colors.green),
    Intelligence("Intra-Personal", 45, Colors.green),
    Intelligence("Spatial", 30, Colors.green),
  ];

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ChartText(value: values[0]),
            ChartText(value: values[1]),
            ChartText(value: values[2]),
            ChartText(value: values[3]),
            ChartText(value: values[4]),
            ChartText(value: values[5]),
            ChartText(value: values[6]),
            ChartText(value: values[7]),

          ],
        ),

      ],
    );
  }
}

class ChartText extends StatelessWidget {
  const ChartText({
    Key key,
    @required this.value,
  }) : super(key: key);

  final Intelligence value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text("${value.typeOfIntelligence}: " , style: TextStyle(
            fontSize: 18, fontFamily: 'VT323', color: value.colors
        ),),
        Text("${value.value}", style: TextStyle(
            fontSize: 18, fontFamily: 'VT323', color: Colors.red
        ),),
      ],

    );
  }
}


