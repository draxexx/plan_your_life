import '../index.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoadingIndicatorDisplayed = false,
    this.hasPostIcon = false,
    this.postIcon,
    this.bgColor = MyColors.midBlue,
    this.textColor = MyColors.white,
    this.borderRadius = 16,
    this.borderColor = MyColors.white,
    this.loadingSpinnerColor = Colors.white,
  });

  final String text;
  final VoidCallback onPressed;
  final bool hasPostIcon, isLoadingIndicatorDisplayed;
  final IconData? postIcon;
  final Color bgColor;
  final Color textColor;
  final Color borderColor;
  final double borderRadius;
  final Color loadingSpinnerColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoadingIndicatorDisplayed ? () {} : onPressed,
      child: Container(
        height: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: isLoadingIndicatorDisplayed
            ? LoadingSpinner(color: loadingSpinnerColor)
            : Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textBuilder(
                      text,
                      textType: TextType.buttonText,
                      color: textColor,
                    ),
                    hasPostIcon
                        ? Row(
                            children: [
                              const SizedBox(width: 8),
                              CustomAppIcon(
                                icon: postIcon!,
                                color: Colors.white,
                                size: 24,
                              )
                            ],
                          )
                        : Container()
                  ],
                ),
              ),
      ),
    );
  }
}
