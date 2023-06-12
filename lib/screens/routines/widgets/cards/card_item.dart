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
                      contentText(context, "Monday", false, MyColors.white, 35),
                      circularSlider(30, 90, 20, MyColors.white,
                          Theme.of(context).primaryColor, MyColors.white),
                      Column(
                        children: [
                          contentText(context, "15 tasks left", false,
                              MyColors.white, 18),
                          const SizedBox(height: 5),
                          contentText(context, "3 tasks completed", false,
                              MyColors.white, 18),
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
                    child: Text(
                      "5",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: getProportionateScreenWidth(45),
                        fontWeight: FontWeight.w900,
                      ),
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
