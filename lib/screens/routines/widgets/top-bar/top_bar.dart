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
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: headerText(
                        context, "app_title", true, MyColors.black, 20),
                  ),
                  Row(
                    children: [
                      Container(
                          child:
                              subText(context, "Please add a routine", false)),
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
