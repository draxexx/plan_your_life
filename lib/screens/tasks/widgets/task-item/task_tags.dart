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
              selectedId: (id) {
                print(id);
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
