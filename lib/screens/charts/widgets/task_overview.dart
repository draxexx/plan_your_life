import '../../../index.dart';

class TaskOverview extends StatefulWidget {
  const TaskOverview({super.key});

  @override
  State<TaskOverview> createState() => _TaskOverviewState();
}

class _TaskOverviewState extends State<TaskOverview> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textBuilder(
                "Task Overview",
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
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  height: SizeConfig.screenHeight! * 0.3,
                  child: Stack(
                    children: [
                      _pieChart(),
                      Positioned(
                        top: 0,
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            textBuilder(
                              "60",
                              textType: TextType.header_2,
                            ),
                            textBuilder(
                              "Total Project",
                              textType: TextType.subText3,
                              color: MyColors.grayLight,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 36),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TaskOverviewPercent(
                    percent: "50",
                    status: "Done",
                    color: Theme.of(context).primaryColorDark,
                  ),
                  const SizedBox(height: 16),
                  TaskOverviewPercent(
                    percent: "30",
                    status: "In Progress",
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(height: 16),
                  TaskOverviewPercent(
                    percent: "20",
                    status: "On Going",
                    color: Theme.of(context).primaryColorLight,
                  ),
                ],
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),
      ],
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
        centerSpaceRadius: 50,
        sections: showingSections(),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: MyColors.darkBlue,
            value: 50,
            showTitle: false,
            title: '50%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: MyColors.white,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: MyColors.blue,
            value: 30,
            showTitle: false,
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
            color: MyColors.grayLight,
            value: 20,
            showTitle: false,
            title: '20%',
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
