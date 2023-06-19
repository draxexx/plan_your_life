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
  final LabelModel _labelModel = LabelModel();

  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  TimeOfDay? _reminderTime;

  final List<SubTaskInputItem> _subTaskInputs = [];
  final List<String> _subTaskInputsValues = [];

  void _submit() async {
    for (var i in _subTaskInputsValues) {
      print(i);
    }

    _formKey.currentState!.save();

    print(_checkTimes());

    print(_taskModel.label!.id);
    print(_taskModel.title);
    print(_taskModel.priority);
    print(_taskModel.startTime);
    print(_taskModel.endTime);
    print(_taskModel.description);
    print(_taskModel.reminder);
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

  void _cancelReminder() {
    setState(() {
      _taskModel.setReminder = null;
    });
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
              : (type == "reminder" && _taskModel.reminder != null)
                  ? _taskModel.reminderTimeOfDay!
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
        } else {
          _taskModel.setReminder = DateTime.now();
          _taskModel.setTime(type, selectedTime);
        }
      });
    }
  }

  String _checkTimes() {
    if (isFirstTimeOfDayBeforeOrEqual(
        _taskModel.endTimeOfDay!, _taskModel.startTimeOfDay!)) {
      return "endtime must be future";
    } else if (isFirstTimeOfDayBeforeOrEqual(
        _taskModel.startTimeOfDay!, _taskModel.reminderTimeOfDay!)) {
      return "reminder must be before";
    } else {
      return "";
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
              SelectTagDialog(
                selectedId: (id) {
                  _labelModel.setId = id;
                  _taskModel.setLabel = _labelModel;
                },
              ),
              barrierDismissible: true,
            ),
            iconButtonSf: IconButton(
              icon: CustomAppIcon(
                icon: Icons.keyboard_arrow_down,
                color: Theme.of(context).disabledColor,
              ),
              onPressed: () => showCustomDialog(
                SelectTagDialog(
                  selectedId: (id) => _labelModel.setId = id,
                ),
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
            onSaved: (value) => _taskModel.setTitle = value,
          ),
          const SizedBox(height: 16),
          textBuilder(
            "Task Priority",
            textType: TextType.header_5,
          ),
          const SizedBox(height: 16),
          SelectableTaskTags(
            selectedPriority: (selected) => _taskModel.setPriority = selected,
          ),
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
            onSaved: (value) => _taskModel.setDescription = value,
          ),
          const SizedBox(height: 16),
          textBuilder(
            "Reminder",
            textType: TextType.header_5,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Reminder(
                onTap: () => _selectTime(
                  _reminderTime ?? TimeOfDay.now(),
                  "reminder",
                ),
                time: _taskModel.formattedReminder,
              ),
              if (_taskModel.reminder != null)
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: CustomAppIcon(
                    icon: Icons.cancel,
                    color: MyColors.red,
                    isPressableIcon: true,
                    onPressed: _cancelReminder,
                  ),
                ),
            ],
          ),
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
