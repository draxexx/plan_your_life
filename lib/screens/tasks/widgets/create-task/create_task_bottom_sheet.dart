import '../../../../index.dart';

void showCreateTaskBottomSheet() {
  showCustomBottomSheet(
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CreateTaskForm(),
      ],
    ),
  );
}

class CreateTaskForm extends StatefulWidget {
  const CreateTaskForm({super.key});

  @override
  State<CreateTaskForm> createState() => _CreateTaskFormState();
}

class _CreateTaskFormState extends State<CreateTaskForm> {
  final _formKey = GlobalKey<FormState>();

  final FocusNode _labelFocusNode = FocusNode();
  final FocusNode _taskFocusNode = FocusNode();
  final FocusNode _subtaskFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();

  @override
  void dispose() {
    _labelFocusNode.dispose();
    _taskFocusNode.dispose();
    _subtaskFocusNode.dispose();
    _descriptionFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textBuilder(
            "Label",
            textType: TextType.header_5,
          ),
          const SizedBox(height: 12),
          CustomTextFormInput(
            focusNode: _labelFocusNode,
            nextFocusNode: _taskFocusNode,
            hintText: "Select tag",
            hasSuffixIcon: true,
            iconButtonSf: IconButton(
              icon: CustomAppIcon(
                icon: Icons.keyboard_arrow_down,
                color: Theme.of(context).disabledColor,
              ),
              onPressed: () {},
            ),
          ),
          const SizedBox(height: 16),
          textBuilder(
            "Task Name",
            textType: TextType.header_5,
          ),
          const SizedBox(height: 12),
          CustomTextFormInput(
            focusNode: _taskFocusNode,
            hintText: "Input text name",
          ),
          const SizedBox(height: 16),
          textBuilder(
            "Task Priority",
            textType: TextType.header_5,
          ),
          const SizedBox(height: 16),
          const SelectableTaskTags(),
          const SizedBox(height: 16),
          textBuilder(
            "Choose Time",
            textType: TextType.header_5,
          ),
          const SizedBox(height: 16),
          const Row(
            children: [
              SelectTime(title: "Start Time"),
              SizedBox(width: 36),
              SelectTime(title: "Due Time"),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              textBuilder(
                "Subtasks",
                textType: TextType.header_5,
              ),
              const SizedBox(width: 4),
              const CustomAppIcon(
                icon: Icons.add_circle_outline,
                color: MyColors.grayLight,
                size: 20,
              ),
            ],
          ),
          const SizedBox(height: 12),
          CustomTextFormInput(
            focusNode: _subtaskFocusNode,
            hintText: "Subtask 1",
            hasSuffixIcon: true,
            iconButtonSf: IconButton(
              icon: CustomAppIcon(
                icon: Icons.remove_circle_outline,
                color: Theme.of(context).disabledColor,
              ),
              onPressed: () {},
            ),
          ),
          const SizedBox(height: 16),
          textBuilder(
            "Description",
            textType: TextType.header_5,
          ),
          const SizedBox(height: 16),
          CustomTextFormInput(
            focusNode: _descriptionFocusNode,
            hintText: "Why am I doing this task?",
            maxLines: 4,
          ),
          const SizedBox(height: 16),
          textBuilder(
            "Reminder",
            textType: TextType.header_5,
          ),
          const SizedBox(height: 16),
          const Reminder(),
          const SizedBox(height: 32),
          CustomButton(
            text: "Create Task",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
