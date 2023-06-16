import '../../../../index.dart';

class MostLabels extends StatefulWidget {
  const MostLabels({super.key});

  @override
  State<MostLabels> createState() => _MostLabelsState();
}

class _MostLabelsState extends State<MostLabels> {
  int touchedIndex = -1;

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
                "Most Labels",
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
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: SizeConfig.screenHeight! * 0.3,
            child: _pieChart(),
          ),
        ],
      ),
    );
  }

  PieChart _pieChart() {
    return PieChart(
      PieChartData(
        pieTouchData: PieTouchData(
          touchCallback: (FlTouchEvent event, pieTouchResponse) {
            setState(() {
              if (!event.isInterestedForInteractions ||
                  pieTouchResponse == null ||
                  pieTouchResponse.touchedSection == null) {
                touchedIndex = -1;
                return;
              }
              touchedIndex =
                  pieTouchResponse.touchedSection!.touchedSectionIndex;
            });
          },
        ),
        borderData: FlBorderData(
          show: false,
        ),
        sectionsSpace: 0,
        centerSpaceRadius: 40,
        sections: showingSections(),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: MyColors.blue,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: MyColors.white,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: MyColors.red,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: MyColors.white,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: MyColors.purple,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: MyColors.white,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: MyColors.orange,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: MyColors.white,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
