import '../../../index.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    super.key,
    required this.isLoginForm,
  });

  final Function(bool) isLoginForm;
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _passFocusNode = FocusNode();

  final bool _isBtnLoading = false;

  void _submit() async {}

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _nameFocusNode.dispose();
    _passFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          textBuilder(
            "Register with email address",
            textType: TextType.header_5,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          CustomTextFormInput(
            focusNode: _emailFocusNode,
            hintText: "Input email",
            nextFocusNode: _nameFocusNode,
            // onSaved: (value) => _taskModel.setTitle = value,
          ),
          const SizedBox(height: 16),
          CustomTextFormInput(
            focusNode: _nameFocusNode,
            hintText: "Input name",
            nextFocusNode: _passFocusNode,
            // onSaved: (value) => _taskModel.setTitle = value,
          ),
          const SizedBox(height: 16),
          CustomTextFormInput(
            focusNode: _passFocusNode,
            hintText: "Input password",
            obscureText: true,
            // onSaved: (value) => _taskModel.setTitle = value,
          ),
          const SizedBox(height: 32),
          CustomButton(
            text: "Continue",
            onPressed: _submit,
            isLoadingIndicatorDisplayed: _isBtnLoading,
          ),
          const SizedBox(height: 32),
          GestureDetector(
            onTap: () => widget.isLoginForm(true),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textBuilder(
                  "Already have an account?",
                  color: Theme.of(context).disabledColor,
                  textType: TextType.subText1,
                ),
                const SizedBox(width: 4),
                textBuilder(
                  "Sign in",
                  color: Theme.of(context).primaryColor,
                  textType: TextType.subText1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
