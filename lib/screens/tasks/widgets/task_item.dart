import '../../../index.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textBuilder(
            "9.00 AM",
            textType: TextType.subText2,
            color: Theme.of(context).disabledColor,
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: cardBorderRadius,
              boxShadow: boxShadow1,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Label(text: "UI DESIGN"),
                        SizedBox(width: 8),
                        Label(
                            text: "HIGH",
                            color: MyColors.red20,
                            textColor: MyColors.red),
                      ],
                    ),
                    Row(
                      children: [
                        CustomAppIcon(
                          icon: Icons.watch_later_outlined,
                          size: 16,
                          color: Theme.of(context).disabledColor,
                        ),
                        const SizedBox(width: 4),
                        textBuilder(
                          "3d",
                          textType: TextType.subText1,
                          color: Theme.of(context).disabledColor,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                textBuilder(
                  "Designing Mobile Application",
                  textType: TextType.header_5,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: LinearPercentIndicator(
                        lineHeight: 14.0,
                        percent: 0.5,
                        backgroundColor:
                            Theme.of(context).dialogBackgroundColor,
                        progressColor: Theme.of(context).primaryColor,
                        barRadius: const Radius.circular(4),
                        animation: true,
                      ),
                    ),
                    const SizedBox(width: 4),
                    textBuilder(
                      "50%",
                      textType: TextType.subText1,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CustomAppIcon(
                          icon: Icons.check_circle,
                          color: MyColors.green,
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        textBuilder(
                          "Done",
                          color: MyColors.green,
                          textType: TextType.subText1,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        textBuilder(
                          "SubTasks",
                          textType: TextType.subText1,
                          color: MyColors.grayLight,
                        ),
                        const CustomAppIcon(
                          icon: Icons.keyboard_arrow_down,
                          color: MyColors.grayLight,
                          size: 18,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
