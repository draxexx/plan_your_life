import '../../index.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(52),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          mainAxisSpacing: 52, // Spacing between each row
          crossAxisSpacing: 52, // Spacing between each column
          childAspectRatio: 1, // Ratio of width to height for each grid item
        ),
        itemCount: 6, // Total number of grid items
        itemBuilder: (BuildContext context, int index) {
          // Builder function for creating each grid item
          return SettingsItem(index: index);
        },
      ),
    );
  }
}
