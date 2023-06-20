import '../../../../index.dart';

class SelectTagDialog extends StatefulWidget {
  const SelectTagDialog({
    super.key,
    required this.selectedLabel,
  });

  final Function(LabelModel) selectedLabel;

  @override
  State<SelectTagDialog> createState() => _SelectTagDialogState();
}

class _SelectTagDialogState extends State<SelectTagDialog> {
  final _formKey = GlobalKey<FormState>();

  final LabelController _labelController = Get.find();

  final FocusNode _tagFocusNode = FocusNode();

  final LabelModel _labelModel = LabelModel();

  bool _isLoading = true;
  bool _submitLoading = false;

  void _submit() async {
    _formKey.currentState!.save();

    setState(() {
      _submitLoading = true;
    });

    var result = await _labelController.addLabel(_labelModel);

    setState(() {
      _submitLoading = false;
    });

    print(result.status);
  }

  Future<void> _fetchAllLabels() async {
    await _labelController.getAllLabels();
  }

  void _loadData() async {
    await _fetchAllLabels();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    _tagFocusNode.dispose();
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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  textBuilder(
                    "Click on the tag to select, if you don't have one then add a new one.",
                    textAlign: TextAlign.center,
                    textType: TextType.subText3,
                  ),
                  const SizedBox(height: 16),
                  _isLoading
                      ? const CircularProgressIndicator()
                      : Container(
                          constraints: BoxConstraints(
                            maxHeight: SizeConfig.screenHeight! * .3,
                          ),
                          child: SingleChildScrollView(
                            child: Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                for (var i in _labelController.labelList!)
                                  GestureDetector(
                                    onTap: () {
                                      widget.selectedLabel(i);
                                      Get.back();
                                    },
                                    child: Label(text: i.name!),
                                  ),
                              ],
                            ),
                          ),
                        ),
                  const SizedBox(height: 8),
                  const Divider(
                    thickness: 1,
                  ),
                  const SizedBox(height: 8),
                  CustomTextFormInput(
                    focusNode: _tagFocusNode,
                    inputAction: TextInputAction.done,
                    hintText: "Input tag name",
                    onSaved: (value) => _labelModel.setName = value,
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    text: "Add Tag",
                    onPressed: _submit,
                    isLoadingIndicatorDisplayed: _submitLoading,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
