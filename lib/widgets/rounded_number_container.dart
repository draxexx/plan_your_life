import '../index.dart';

Container roundedContainer(
    double marginTop,
    double marginBottom,
    double marginRight,
    double marginLeft,
    double height,
    double width,
    Color beginColor,
    Color endColor,
    Widget child) {
  return Container(
    margin: EdgeInsets.only(
        top: marginTop,
        bottom: marginBottom,
        right: marginRight,
        left: marginLeft),
    height: SizeConfig.screenHeight! * height,
    width: SizeConfig.screenWidth! * width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          beginColor,
          endColor,
        ],
      ),
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10,
          offset: Offset(0, 5),
        ),
      ],
    ),
    child: child,
  );
}

Container circleContainer(
    double size, Widget child, Color beginColor, Color endColor) {
  return Container(
    width: getProportionateScreenWidth(size),
    height: getProportionateScreenWidth(size),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          beginColor,
          endColor,
        ],
      ),
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 7,
          offset: Offset(0, 5),
        ),
      ],
    ),
    child: Center(
      child: child,
    ),
  );
}
