import '../../../index.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textBuilder(
                  "My Task",
                  textType: TextType.header_3,
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).dialogBackgroundColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      CustomAppIcon(
                        icon: Icons.calendar_month,
                        color: Theme.of(context).primaryColor,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      textBuilder(
                        "15 March",
                        textType: TextType.subText1,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          for (int i = 0; i < 3; i++) const TaskItem(),
        ],
      ),
    );
  }
}
