import '../../../../../../index.dart';

class TaskTitleEditDialog extends StatefulWidget {
  const TaskTitleEditDialog({super.key});

  @override
  State<TaskTitleEditDialog> createState() => _TaskTitleEditDialogState();
}

class _TaskTitleEditDialogState extends State<TaskTitleEditDialog> {
  final FocusNode _titleFocusNode = FocusNode();

  @override
  void dispose() {
    _titleFocusNode.dispose();
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
                  focusNode: _titleFocusNode,
                  inputAction: TextInputAction.done,
                  hintText: "Input title",
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomButton(
                      text: "Edit Task",
                      onPressed: () {},
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
