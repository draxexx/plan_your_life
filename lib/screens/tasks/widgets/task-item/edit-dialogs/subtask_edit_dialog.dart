import '../../../../../../index.dart';

class SubTaskEditDialog extends StatefulWidget {
  const SubTaskEditDialog({super.key});

  @override
  State<SubTaskEditDialog> createState() => _SubTaskEditDialogState();
}

class _SubTaskEditDialogState extends State<SubTaskEditDialog> {
  final FocusNode _subtaskFocusNode = FocusNode();

  @override
  void dispose() {
    _subtaskFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: MyColors.black,
                offset: Offset(0, 2),
                blurRadius: 5,
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CustomTextFormInput(
                  focusNode: _subtaskFocusNode,
                  inputAction: TextInputAction.done,
                  hintText: "Input subtask",
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomButton(
                      text: "Edit Task",
                      onPressed: () {},
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () => print("delete"),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomAppIcon(
                            icon: Icons.delete_forever,
                            color: MyColors.red,
                            size: 16,
                          ),
                          textBuilder(
                            "Delete this task",
                            color: MyColors.red,
                            textType: TextType.subText1,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
