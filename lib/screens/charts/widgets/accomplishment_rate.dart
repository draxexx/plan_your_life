import '../../../index.dart';

class AccomplishmentRate extends StatelessWidget {
  const AccomplishmentRate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: textBuilder(
            "Accomplishment Rate",
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomAppImage(
                imgUrl: "assets/images/bronz.png",
              ),
              textBuilder(
                "Awful",
                textType: TextType.header_3,
              ),
              circularSlider(
                30,
                80,
                20,
                MyColors.grayLight20,
                Theme.of(context).primaryColor,
                MyColors.black,
                trackWidth: 10,
                progressBarWidth: 8,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
