import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class TodayAttendance extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  TodayAttendance({Key? key}) : super(key: key);

  @override
  TodayAttendanceState createState() => TodayAttendanceState();
}

class TodayAttendanceState extends State<TodayAttendance> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Colors.blueGrey, width: 0.5),
        ),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * .35,
            width: MediaQuery.of(context).size.width * .80,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Today's Report",
                    style: GoogleFonts.poppins(
                        color: Color(0xffd43b24),
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        letterSpacing: 0.3),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 0.3,
                  endIndent: 10,
                  indent: 10,
                ),
                _buildChart(),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class ChartData {
  ChartData(
    this.color,
    this.x,
    this.y,
  );
  final String x;
  final double y;
  final Color color;
}

Widget _buildChart() {
  //Here we have wrapped our chart with Expanded widget
  return Expanded(
    child: SfCircularChart(series: <CircularSeries>[
      DoughnutSeries<ChartData, String>(
          dataSource: [
            ChartData(Color(0xff4d3a58), 'hi', 100),
            ChartData(Color(0xffd43b24), 'to', 100)
          ],
          pointColorMapper: (ChartData data, _) => data.color,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          // Radius of doughnut
          radius: '90%')
    ]),
  );
}
