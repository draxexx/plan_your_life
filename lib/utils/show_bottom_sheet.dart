import '../index.dart';

void showCustomBottomSheet({
  required Widget child,
  double heightPercentage = .65,
  double height = 400,
  double horizontalPadding = 20,
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  bool isVerticallyScrollable = true,
}) {
  // ignore: no_leading_underscores_for_local_identifiers
  Widget _bottomSheetContent = SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 28),
          child: SizedBox(
            height: 10.0,
            child: Center(
              child: Container(
                width: 48,
                margin: const EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                height: 3,
                color: MyColors.grayLight,
              ),
            ),
          ),
        ),
        child,
      ],
    ),
  );

  Get.bottomSheet(
    ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: Get.height * heightPercentage > 492
            ? Get.height * heightPercentage
            : 492,
      ),
      child: Container(
        //height: height, // Removed bottom sheet height to fix empty area
        padding:
            EdgeInsets.symmetric(vertical: 28, horizontal: horizontalPadding),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        child: _bottomSheetContent,
      ),
    ),
    ignoreSafeArea: true,
    isScrollControlled: true,
  );
}
