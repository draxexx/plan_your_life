import '../../index.dart';

class CustomTextFormInput extends StatelessWidget {
  const CustomTextFormInput({
    super.key,
    required this.focusNode,
    this.isRequired = false,
    this.fillColor = MyColors.grayLight20,
    this.hintText,
    this.inputType,
    this.onValidate,
    this.onChanged,
    this.initialValue,
    this.nextFocusNode,
    this.inputAction = TextInputAction.next,
    this.obscureText = false,
    this.readOnly = false,
    this.borderRadius = 16,
    this.hasSuffixIcon = false,
    this.hasPrefixIcon = false,
    this.iconButtonSf,
    this.iconButtonPre,
    this.onSaved,
    this.filled = true,
    this.borderWidth = 1,
    this.borderColor = MyColors.white,
    this.textColor = MyColors.grayLight,
    this.hintTextColor = MyColors.grayLight,
    this.controller,
    this.onTap,
    this.maxLines = 1,
    this.textCapitalization = TextCapitalization.words,
    this.labelText,
  });

  final Color fillColor;
  final String? hintText;
  final String? initialValue;
  final InputType? inputType;
  final bool isRequired;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final String? Function(String?)? onValidate;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;
  final TextInputAction inputAction;
  final bool obscureText;
  final bool readOnly;
  final double borderRadius;
  final bool hasSuffixIcon;
  final bool hasPrefixIcon;
  final IconButton? iconButtonSf;
  final IconButton? iconButtonPre;
  final bool filled;
  final double borderWidth;
  final Color borderColor;
  final Color textColor;
  final Color hintTextColor;
  final TextEditingController? controller;
  final Function()? onTap;
  final int maxLines;
  final TextCapitalization textCapitalization;
  final String? labelText;

  // Provide suitable keyboard option according to input type
  TextInputType setKeyboard(inputType) {
    if (inputType == InputType.email) {
      return TextInputType.emailAddress;
    } else if (inputType == InputType.phone) {
      return const TextInputType.numberWithOptions(
        decimal: true,
        signed: true,
      );
    } else {
      return TextInputType.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      focusNode: focusNode,
      keyboardType: setKeyboard(inputType),
      textInputAction: inputAction,
      obscureText: obscureText,
      readOnly: readOnly,
      controller: controller,
      onTap: onTap,
      minLines: 1,
      maxLines: maxLines,
      textCapitalization: textCapitalization,
      style: TextStyle(
        fontSize: getProportionateScreenWidth(14),
        color: textColor,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        fillColor: fillColor,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: borderWidth,
            color: borderColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
          borderSide: BorderSide(
            width: borderWidth,
            color: borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
          borderSide: BorderSide(
            width: borderWidth,
            color: borderColor,
          ),
        ),
        labelStyle: TextStyle(
          fontSize: getProportionateScreenWidth(14),
          color: MyColors.grayLight,
        ),
        filled: filled,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: getProportionateScreenWidth(14),
          color: hintTextColor,
          fontWeight: FontWeight.w700,
        ),
        suffixIcon: hasSuffixIcon ? iconButtonSf : null,
        prefixIcon: hasPrefixIcon ? iconButtonPre : null,

        //fillColor: RJDriverColors.textFormFieldBackground,
      ),
      // The validator receives the text that the user has entered.
      validator: isRequired ? onValidate : null,
      onChanged: onChanged,
      onSaved: onSaved,
      onFieldSubmitted: (_) {
        if (nextFocusNode != null) {
          FocusScope.of(context).requestFocus(nextFocusNode);
        }
      },
    );
  }
}
