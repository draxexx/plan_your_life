import '../../../../index.dart';

class SelectableTaskTags extends StatefulWidget {
  const SelectableTaskTags({super.key});

  @override
  State<SelectableTaskTags> createState() => _SelectableTaskTagsState();
}

class _SelectableTaskTagsState extends State<SelectableTaskTags> {
  int? _selected = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _selected = 0;
            });
          },
          child: Label(
            text: "LOW",
            color: _selected == 0 ? MyColors.purple : MyColors.purple20,
            textColor: _selected == 0 ? MyColors.white : MyColors.purple,
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            setState(() {
              _selected = 1;
            });
          },
          child: Label(
            text: "MEDIUM",
            color: _selected == 1 ? MyColors.orange : MyColors.orange20,
            textColor: _selected == 1 ? MyColors.white : MyColors.orange,
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            setState(() {
              _selected = 2;
            });
          },
          child: Label(
            text: "HIGH",
            color: _selected == 2 ? MyColors.red : MyColors.red20,
            textColor: _selected == 2 ? MyColors.white : MyColors.red,
          ),
        ),
      ],
    );
  }
}
