import '../../../../../index.dart';

class PersonalSkillsItem extends StatelessWidget {
  const PersonalSkillsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            color: MyColors.grayLight,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(height: 4),
        textBuilder(
          "Work",
          textType: TextType.header_5,
        ),
        const SizedBox(height: 4),
        textBuilder(
          "0 points",
          textType: TextType.subText3,
        ),
      ],
    );
  }
}
