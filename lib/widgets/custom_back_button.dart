import '../index.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppIcon(
      icon: Icons.arrow_back_ios,
      isPressableIcon: true,
      onPressed: () => Get.back(),
      color: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
