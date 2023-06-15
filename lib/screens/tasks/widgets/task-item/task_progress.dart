import '../../../../index.dart';

class TaskProgress extends StatelessWidget {
  const TaskProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: LinearPercentIndicator(
            lineHeight: 14.0,
            percent: 0.5,
            backgroundColor: Theme.of(context).dialogBackgroundColor,
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
    );
  }
}
