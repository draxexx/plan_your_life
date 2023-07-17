import '../../../index.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.isLoginForm,
  });

  final Function(bool) isLoginForm;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passFocusNode = FocusNode();

  final bool _isBtnLoading = false;

  void _submit() async {}

  @override
  void dispose() {
    _emailFocusNode.dispose();
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
            "Login with email address",
            textType: TextType.header_5,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          CustomTextFormInput(
            focusNode: _emailFocusNode,
            hintText: "Input email",
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
          const SizedBox(height: 16),
          Row(
            children: [
              const Spacer(),
              textBuilder(
                "Forget password?",
                color: Theme.of(context).primaryColor,
                textType: TextType.subText1,
                textAlign: TextAlign.end,
              ),
            ],
          ),
          const SizedBox(height: 32),
          CustomButton(
            text: "Continue",
            onPressed: _submit,
            isLoadingIndicatorDisplayed: _isBtnLoading,
          ),
          const SizedBox(height: 32),
          GestureDetector(
            onTap: () => widget.isLoginForm(false),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textBuilder(
                  "Don't have an account?",
                  color: Theme.of(context).disabledColor,
                  textType: TextType.subText1,
                ),
                const SizedBox(width: 4),
                textBuilder(
                  "Sign up",
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
