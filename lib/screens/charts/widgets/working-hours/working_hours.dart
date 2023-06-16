import '../../../../index.dart';

class WorkingHours extends StatefulWidget {
  const WorkingHours({super.key});

  @override
  State<WorkingHours> createState() => _WorkingHoursState();
}

class _WorkingHoursState extends State<WorkingHours> {
  List<FlSpot> _spots = [];

  void _setFlSpots() {
    _spots.add(const FlSpot(0, 3));
    _spots.add(const FlSpot(1, 2));
    _spots.add(const FlSpot(2, 4));
    _spots.add(const FlSpot(3, 1));
    _spots.add(const FlSpot(4, 0));
    _spots.add(const FlSpot(5, 2));
    _spots.add(const FlSpot(6, 4));
  }

  @override
  void initState() {
    super.initState();
    _setFlSpots();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: cardBorderRadius,
        boxShadow: boxShadow1,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textBuilder(
                "Working Hours",
                textType: TextType.header_5,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: MyColors.grayLight20,
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    textBuilder(
                      "Weekly",
                      textType: TextType.subText1,
                      color: MyColors.grayLight,
                    ),
                    const CustomAppIcon(
                      icon: Icons.keyboard_arrow_down,
                      color: MyColors.grayLight,
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: SizeConfig.screenHeight! * 0.3,
            child: LineChart(
              _sampleData(),
            ),
          )
        ],
      ),
    );
  }

  LineChartData _sampleData() {
    return LineChartData(
      lineTouchData: LineTouchData(
        enabled: true,
        touchTooltipData: touchToolTipData,
      ),
      gridData: const FlGridData(
        show: true,
        drawHorizontalLine: true,
        drawVerticalLine: false,
      ),
      titlesData: titlesData,
      borderData: borderData,
      minX: 0,
      maxX: 7,
      maxY: 5,
      minY: 0,
      lineBarsData: linesBarData(_spots),
    );
  }

  var borderData = FlBorderData(
    show: true,
    border: const Border(
      bottom: BorderSide(
        color: MyColors.grayLight,
        width: 1,
      ),
      left: BorderSide(
        color: Colors.transparent,
      ),
      right: BorderSide(
        color: Colors.transparent,
      ),
      top: BorderSide(
        color: Colors.transparent,
      ),
    ),
  );

  var titlesData = const FlTitlesData(
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 28,
        getTitlesWidget: bottomTitleWidgets,
      ),
    ),
    leftTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        getTitlesWidget: leftTitleWidgets,
        reservedSize: 36,
      ),
    ),
    topTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: false,
      ),
    ),
    rightTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: false,
      ),
    ),
  );

  var touchToolTipData = LineTouchTooltipData(
    getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
      return touchedBarSpots.map((barSpot) {
        final flSpot = barSpot;
        // if (flSpot.y == 0) {
        //   return null;
        // }
        String result = "";
        if (flSpot.x == 0) {
          result = "mon";
        } else if (flSpot.x == 1) {
          result = "tue";
        } else if (flSpot.x == 2) {
          result = "wed";
        } else if (flSpot.x == 3) {
          result = "thu";
        } else if (flSpot.x == 4) {
          result = "fri";
        } else if (flSpot.x == 5) {
          result = "sat";
        } else {
          result = "sun";
        }
        return LineTooltipItem(
          result,
          const TextStyle(color: MyColors.white, fontWeight: FontWeight.bold),
        );
      }).toList();
    },
  );
}
