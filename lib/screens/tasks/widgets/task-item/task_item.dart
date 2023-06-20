import '../../../../index.dart';

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
            "9.00 AM - 1.00 PM",
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TaskTags(),
                    TaskDuration(),
                  ],
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () => showCustomDialog(
                    const TaskTitleEditDialog(),
                    barrierDismissible: true,
                  ),
                  child: textBuilder(
                    "Designing Mobile Application",
                    textType: TextType.header_5,
                  ),
                ),
                const SizedBox(height: 8),
                const TaskProgress(),
                const SizedBox(height: 16),
                const TaskStatusAndSubtasks(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
