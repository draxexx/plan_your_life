import '../../../../index.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              roundedContainer(
                60,
                0,
                20,
                20,
                0.6,
                0.7,
                Theme.of(context).primaryColorLight,
                Theme.of(context).primaryColorDark,
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      textBuilder(
                        AppLocalizations.of(context).translate("monday"),
                        color: MyColors.white,
                        textType: TextType.header_2,
                        shadows: shadow1,
                      ),
                      circularSlider(30, 90, 20, MyColors.white,
                          Theme.of(context).primaryColor, MyColors.white),
                      Column(
                        children: [
                          textBuilder(
                            "15 tasks left",
                            color: MyColors.white,
                            textType: TextType.header_3,
                            shadows: shadow1,
                          ),
                          const SizedBox(height: 5),
                          textBuilder(
                            "3 tasks completed",
                            color: MyColors.white,
                            textType: TextType.header_3,
                            shadows: shadow1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 20,
                right: 16,
                left: 16,
                child: circleContainer(
                  80,
                  Center(
                    child: textBuilder(
                      "5",
                      color: Theme.of(context).primaryColor,
                      textType: TextType.header_4,
                    ),
                  ),
                  MyColors.white,
                  MyColors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
