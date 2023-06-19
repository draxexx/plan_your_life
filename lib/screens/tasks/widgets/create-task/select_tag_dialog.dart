import '../../../../index.dart';

class SelectTagDialog extends StatefulWidget {
  const SelectTagDialog({super.key});

  @override
  State<SelectTagDialog> createState() => _SelectTagDialogState();
}

class _SelectTagDialogState extends State<SelectTagDialog> {
  final FocusNode _tagFocusNode = FocusNode();

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
                Container(
                  constraints: BoxConstraints(
                    maxHeight: SizeConfig.screenHeight! * .3,
                  ),
                  child: SingleChildScrollView(
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (int i = 0; i < 100; i++)
                          const Label(text: "UI DESIGN"),
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
                ),
                const SizedBox(height: 16),
                CustomButton(
                  text: "Add Tag",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
