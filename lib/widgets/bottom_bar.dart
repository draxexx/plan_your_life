import '../index.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({
    super.key,
    required this.getIndex,
  });

  final Function(int) getIndex;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _index = 1;

  String _translate(String text) {
    return AppLocalizations.of(context).translate(text);
  }

  void _changeIndex(int i) {
    setState(() {
      _index = i;
      widget.getIndex(_index);
    });
  }

  TabItem _tabItem(IconData icon, String title) {
    return TabItem(
      icon: Icon(
        icon,
        color: MyColors.white,
      ),
      title: title,
      activeIcon: Icon(
        icon,
        color: Theme.of(context).primaryColor,
        size: getProportionateScreenWidth(40),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      backgroundColor: Theme.of(context).primaryColor,
      color: MyColors.white,
      initialActiveIndex: 1,
      onTap: (int i) => _changeIndex(i),
      items: [
        _tabItem(
          Icons.pie_chart,
          _translate("charts"),
        ),
        _tabItem(
          Icons.home,
          _translate("home"),
        ),
        _tabItem(
          Icons.settings,
          _translate("settings"),
        ),
      ],
    );
  }
}
