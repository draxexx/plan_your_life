import '../../index.dart';

class CustomAppIcon extends StatelessWidget {
  const CustomAppIcon({
    super.key,
    required this.icon,
    this.color,
    this.size = 24,
    this.onPressed,
    this.isPressableIcon = false,
    this.isFontAwesomeIcon = false,
  });

  final IconData icon;
  final Color? color;
  final double size;
  final VoidCallback? onPressed;
  final bool isPressableIcon, isFontAwesomeIcon;

  @override
  Widget build(BuildContext context) {
    if (!isPressableIcon) {
      if (isFontAwesomeIcon) {
        return FaIcon(
          icon,
          color: color,
          size: getProportionateScreenWidth(size),
        );
      }
    } else {
      if (isFontAwesomeIcon) {
        return IconButton(
          icon: FaIcon(
            icon,
            color: color,
            size: getProportionateScreenWidth(size),
          ),
          splashRadius: 16,
          onPressed: onPressed,
        );
      } else {
        return GestureDetector(
          onTap: onPressed,
          child: Icon(
            icon,
            color: color,
            size: getProportionateScreenWidth(size),
          ),
        );
      }
    }

    return Icon(
      icon,
      color: color,
      size: getProportionateScreenWidth(size),
    );
  }
}
