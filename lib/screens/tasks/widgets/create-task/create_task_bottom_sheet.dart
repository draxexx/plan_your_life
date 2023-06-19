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
  final FocusNode _descriptionFocusNode = FocusNode();

  final TaskModel _taskModel = TaskModel();

  TimeOfDay? _startTime;
  TimeOfDay? _endTime;

  final List<SubTaskInputItem> _subTaskInputs = [];
  final List<String> _subTaskInputsValues = [];

  void _submit() async {
    for (var i in _subTaskInputsValues) {
      print(i);
    }
  }

  void _addSubTask() {
    _subTaskInputsValues.add("");

    _subTaskInputs.add(
      SubTaskInputItem(
        index: _subTaskInputs.length,
        getIndex: (index) => _removeSubTask(index),
        getValue: (value, index) => _subTaskInputsValues[index] = value,
      ),
    );

    setState(() {});
  }

  void _removeSubTask(int index) {
    _subTaskInputs.removeAt(index);
    _subTaskInputsValues.removeAt(index);

    _updateInputIndexes();

    setState(() {});
  }

  void _updateInputIndexes() {
    int length = _subTaskInputs.length;

    _subTaskInputs.clear();

    for (int i = 0; i < length; i++) {
      _subTaskInputs.add(
        SubTaskInputItem(
          index: _subTaskInputs.length,
          getIndex: (index) => _removeSubTask(index),
          getValue: (value, index) => _subTaskInputsValues[index] = value,
          text: _subTaskInputsValues[i],
        ),
      );
    }
  }

  Future<void> _selectTime(TimeOfDay selectedTime, String type) async {
    var pickedTime = await showTimePicker(
      context: context,
      initialTime: (type == "start" && _taskModel.startTime != null)
          ? _taskModel.startTimeOfDay!
          : (type == "end" && _taskModel.endTime != null)
              ? _taskModel.endTimeOfDay!
              : selectedTime,
    );

    if (pickedTime != null) {
      selectedTime = pickedTime;

      setState(() {
        if (type == "start") {
          _taskModel.setStartTime = DateTime.now();
          _taskModel.setTime(type, selectedTime);
        } else if (type == "end") {
          _taskModel.setEndTime = DateTime.now();
          _taskModel.setTime(type, selectedTime);
        }
      });
    }
  }

  @override
  void dispose() {
    _labelFocusNode.dispose();
    _taskFocusNode.dispose();
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
            readOnly: true,
            hasSuffixIcon: true,
            onTap: () => showCustomDialog(
              const SelectTagDialog(),
              barrierDismissible: true,
            ),
            iconButtonSf: IconButton(
              icon: CustomAppIcon(
                icon: Icons.keyboard_arrow_down,
                color: Theme.of(context).disabledColor,
              ),
              onPressed: () => showCustomDialog(
                const SelectTagDialog(),
                barrierDismissible: true,
              ),
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
          Row(
            children: [
              SelectTime(
                onTap: () =>
                    _selectTime(_startTime ?? TimeOfDay.now(), "start"),
                title: "Start Time",
                time: _taskModel.formattedStartTime ?? "",
              ),
              const SizedBox(width: 36),
              SelectTime(
                onTap: () => _selectTime(_endTime ?? TimeOfDay.now(), "end"),
                title: "Due Time",
                time: _taskModel.formattedEndTime ?? "",
              ),
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
              CustomAppIcon(
                icon: Icons.add_circle_outline,
                color: MyColors.green,
                size: 20,
                isPressableIcon: true,
                onPressed: _addSubTask,
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (_subTaskInputs.isNotEmpty) ..._subTaskInputs,
          if (_subTaskInputs.isEmpty)
            textBuilder("There is no subtask added.",
                textType: TextType.subText2),
          const SizedBox(height: 12),
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
            onPressed: _submit,
          ),
        ],
      ),
    );
  }
}
