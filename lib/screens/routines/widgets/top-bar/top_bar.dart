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
                  // child: headerText(
                  //     context, "app_title", true, MyColors.black, 20),
                  child: textBuilder(
                    AppLocalizations.of(context).translate("app_title"),
                    textType: TextType.header_1,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      child: textBuilder(
                        AppLocalizations.of(context)
                            .translate("please_add_a_routine"),
                        textType: TextType.subText1,
                      ),
                    ),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () {},
                      child: circleContainer(
                        20,
                        Icon(
                          Icons.add,
                          color: MyColors.white,
                          size: getProportionateScreenWidth(15),
                        ),
                        MyColors.blue,
                        MyColors.blue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: circleContainer(
              40,
              Icon(
                Icons.collections_bookmark,
                color: MyColors.white,
                size: getProportionateScreenWidth(20),
              ),
              Colors.grey,
              Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
