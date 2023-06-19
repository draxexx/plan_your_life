import '../../../../index.dart';

// ignore: must_be_immutable
class SubTaskItem extends StatefulWidget {
  SubTaskItem({
    super.key,
    required this.task,
    required this.isDone,
  });

  final String task;
  bool isDone;

  @override
  State<SubTaskItem> createState() => _SubTaskItemState();
}

class _SubTaskItemState extends State<SubTaskItem> {
  void _toggleStatus() {
    setState(() {
      widget.isDone = !widget.isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => showCustomDialog(
                  const SubTaskEditDialog(),
                  barrierDismissible: true,
                ),
                child: textBuilder(
                  widget.task,
                  textType: TextType.subText1,
                ),
              ),
            ),
            const SizedBox(width: 16),
            CustomAppIcon(
              icon: Icons.check_circle,
              color: widget.isDone ? MyColors.green : MyColors.grayLight,
              isPressableIcon: true,
              onPressed: _toggleStatus,
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
