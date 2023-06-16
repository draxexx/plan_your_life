import '../../../../index.dart';

class PersonalSkills extends StatelessWidget {
  const PersonalSkills({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: textBuilder(
            "Personal Skills",
            textType: TextType.header_5,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: cardBorderRadius,
            boxShadow: boxShadow1,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PersonalSkillsItem(),
              PersonalSkillsItem(),
              PersonalSkillsItem(),
            ],
          ),
        ),
      ],
    );
  }
}
