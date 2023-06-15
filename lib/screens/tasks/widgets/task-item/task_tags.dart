import '../../../../index.dart';

class TaskTags extends StatelessWidget {
  const TaskTags({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Label(text: "UI DESIGN"),
        SizedBox(width: 8),
        Label(text: "HIGH", color: MyColors.red20, textColor: MyColors.red),
      ],
    );
  }
}
