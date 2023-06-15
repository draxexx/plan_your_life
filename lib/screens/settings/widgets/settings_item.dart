import '../../../index.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key,
    required this.index,
  });

  final int index;

  IconData _setIcon() {
    switch (index) {
      case 0:
        return Icons.save;
      case 1:
        return Icons.lock;
      case 2:
        return Icons.notifications_active;
      case 3:
        return Icons.message;
      case 4:
        return Icons.info;
      case 5:
        return Icons.email;
      default:
        return Icons.save;
    }
  }

  String _setTitle() {
    switch (index) {
      case 0:
        return "Backup";
      case 1:
        return "Lock";
      case 2:
        return "Notifications";
      case 3:
        return "Quotes";
      case 4:
        return "About";
      case 5:
        return "Contact Us";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: cardBorderRadius,
        boxShadow: boxShadow1,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomAppIcon(
            icon: _setIcon(),
            color: Theme.of(context).primaryColor,
            size: 36,
          ),
          const SizedBox(height: 16),
          textBuilder(_setTitle(),
              textType: TextType.header_5, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
