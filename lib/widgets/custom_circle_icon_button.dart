import '../index.dart';

class CustomCircleIconButton extends StatelessWidget {
  const CustomCircleIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.size = 32,
    this.color = MyColors.midBlue,
    this.iconSize = 24,
    this.bgColor = MyColors.green,
  });

  final double size;
  final IconData icon;
  final Color color;
  final double iconSize;
  final Color bgColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(500),
          border: Border.all(
            color: bgColor,
            width: 2,
          ),
        ),
        child: Center(
          child: CustomAppIcon(
            icon: icon,
            color: color,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
