import '../../../../index.dart';

// ignore: must_be_immutable
class SubTaskInputItem extends StatelessWidget {
  SubTaskInputItem({
    super.key,
    this.index,
    required this.getIndex,
    required this.getValue,
    this.text,
  });

  int? index;
  final Function(int) getIndex;
  final Function(String, int) getValue;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormInput(
          focusNode: FocusNode(),
          hintText: "Subtask ${index! + 1}",
          hasSuffixIcon: true,
          onChanged: (value) => getValue(value, index!),
          controller: TextEditingController(text: text),
          iconButtonSf: IconButton(
            icon: CustomAppIcon(
              icon: Icons.remove_circle_outline,
              color: Theme.of(context).disabledColor,
            ),
            onPressed: () => getIndex(index!),
          ),
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}
