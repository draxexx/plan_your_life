import '../../../../index.dart';

class TaskTags extends StatelessWidget {
  const TaskTags({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => showCustomDialog(
            SelectTagDialog(
              selectedLabel: (label) {
                print(label);
              },
            ),
            barrierDismissible: true,
          ),
          child: const Label(text: "UI DESIGN"),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () => showCustomDialog(
            const PriorityEditTask(),
            barrierDismissible: true,
          ),
          child: const Label(
              text: "HIGH", color: MyColors.red20, textColor: MyColors.red),
        ),
      ],
    );
  }
}
