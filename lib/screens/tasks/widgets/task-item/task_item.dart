import '../../../../index.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({
    super.key,
    required this.taskModel,
  });

  final TaskModel taskModel;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  Future<void> _updateStartTime() async {
    var pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      var selectedTime = pickedTime;
    }
  }

  Future<void> _updateEndTime() async {
    var pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      var selectedTime = pickedTime;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: _updateStartTime,
                child: textBuilder(
                  "9.00 AM",
                  textType: TextType.subText2,
                  color: Theme.of(context).disabledColor,
                ),
              ),
              textBuilder(
                " - ",
                textType: TextType.subText2,
                color: Theme.of(context).disabledColor,
              ),
              GestureDetector(
                onTap: _updateEndTime,
                child: textBuilder(
                  "1.00 PM",
                  textType: TextType.subText2,
                  color: Theme.of(context).disabledColor,
                ),
              ),
            ],
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
                    widget.taskModel.title!,
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
