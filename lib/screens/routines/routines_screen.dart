import '../../index.dart';

class RoutinesScreen extends StatefulWidget {
  const RoutinesScreen({super.key});

  @override
  State<RoutinesScreen> createState() => _RoutinesScreenState();
}

class _RoutinesScreenState extends State<RoutinesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50),
      child: const SingleChildScrollView(
        child: Column(
          children: [
            TopBar(),
            CardList(),
          ],
        ),
      ),
    );
  }
}
