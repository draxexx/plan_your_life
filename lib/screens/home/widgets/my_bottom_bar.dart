import '../../../index.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({super.key});

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  int _index = 1;

  Widget _selectedScreen(int i) {
    if (i == 1) {
      return Container();
    } else if (i == 2) {
      return Container();
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _selectedScreen(_index),
      ),
      bottomNavigationBar: BottomBar(
        getIndex: (v) => setState(
          () => _index = v,
        ),
      ),
    );
  }
}
