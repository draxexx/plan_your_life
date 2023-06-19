import '../../index.dart';

class ChartsScreen extends StatelessWidget {
  const ChartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 64),
          AccomplishmentRate(),
          SizedBox(height: 48),
          TaskOverview(),
          SizedBox(height: 48),
          WorkingHours(),
          SizedBox(height: 48),
          TaskActivities(),
          SizedBox(height: 48),
          MostLabels(),
          SizedBox(height: 48),
        ],
      ),
    );
  }
}
