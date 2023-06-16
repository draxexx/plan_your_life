import '../../../index.dart';

class TaskOverview extends StatelessWidget {
  const TaskOverview({super.key});

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
              customInnerWidgetSlider(
                30,
                150,
                20,
                MyColors.grayLight,
                Theme.of(context).primaryColor,
                MyColors.black,
                trackWidth: 18,
                progressBarWidth: 15,
              ),
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
            ],
          ),
        ),
      ],
    );
  }
}
