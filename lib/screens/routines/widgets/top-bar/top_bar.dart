import '../../../../index.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: textBuilder(
                    AppLocalizations.of(context).translate("app_title"),
                    textType: TextType.header_1,
                  ),
                ),
              ],
            ),
          ),
          // GestureDetector(
          //   onTap: () {},
          //   child: circleContainer(
          //     40,
          //     Icon(
          //       Icons.collections_bookmark,
          //       color: MyColors.white,
          //       size: getProportionateScreenWidth(20),
          //     ),
          //     Colors.grey,
          //     Colors.grey,
          //   ),
          // ),
        ],
      ),
    );
  }
}
