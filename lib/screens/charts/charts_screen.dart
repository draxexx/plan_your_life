import '../../index.dart';

class ChartsScreen extends StatelessWidget {
  const ChartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 64),
        AccomplishmentRate(),
        SizedBox(height: 16),
        TaskOverview(),
      ],
    );
  }
}
