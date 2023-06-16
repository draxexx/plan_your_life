import '../index.dart';

SleekCircularSlider circularSlider(
  double initialValue,
  double size,
  double textSize,
  Color trackColor,
  Color progressBarColor,
  Color textColor, {
  double trackWidth = 15,
  double progressBarWidth = 10,
}) {
  return SleekCircularSlider(
    initialValue: initialValue,
    min: 0,
    max: 100,
    appearance: CircularSliderAppearance(
      size: getProportionateScreenWidth(size),
      startAngle: 100,
      angleRange: 360,
      customColors: CustomSliderColors(
        trackColor: trackColor,
        progressBarColor: progressBarColor,
        dotColor: Colors.transparent,
      ),
      customWidths: CustomSliderWidths(
        trackWidth: trackWidth,
        progressBarWidth: progressBarWidth,
      ),
      infoProperties: InfoProperties(
        mainLabelStyle: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: getProportionateScreenWidth(textSize),
        ),
      ),
    ),
  );
}

SleekCircularSlider thinCircularSlider(
    double initialValue,
    double size,
    double textSize,
    Color trackColor,
    Color progressBarColor,
    Color textColor) {
  return SleekCircularSlider(
    initialValue: initialValue,
    min: 0,
    max: 100,
    appearance: CircularSliderAppearance(
      size: getProportionateScreenWidth(size),
      startAngle: 100,
      angleRange: 360,
      customColors: CustomSliderColors(
        trackColor: trackColor,
        progressBarColor: progressBarColor,
        dotColor: Colors.transparent,
      ),
      customWidths: CustomSliderWidths(
        trackWidth: 10,
        progressBarWidth: 8,
      ),
      infoProperties: InfoProperties(
        mainLabelStyle: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: getProportionateScreenWidth(textSize),
        ),
      ),
    ),
  );
}

SleekCircularSlider customInnerWidgetSlider(
  double initialValue,
  double size,
  double textSize,
  Color trackColor,
  Color progressBarColor,
  Color textColor, {
  double trackWidth = 15,
  double progressBarWidth = 10,
}) {
  return SleekCircularSlider(
    initialValue: initialValue,
    min: 0,
    max: 100,
    innerWidget: (v) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textBuilder(
            "${v.toInt()}",
            textType: TextType.header_2,
          ),
          textBuilder(
            "Total Project",
            textType: TextType.subText1,
            color: MyColors.grayLight,
          ),
        ],
      );
    },
    appearance: CircularSliderAppearance(
      size: getProportionateScreenWidth(size),
      startAngle: 100,
      angleRange: 360,
      customColors: CustomSliderColors(
        trackColor: trackColor,
        progressBarColor: progressBarColor,
        dotColor: Colors.transparent,
      ),
      customWidths: CustomSliderWidths(
        trackWidth: trackWidth,
        progressBarWidth: progressBarWidth,
      ),
      infoProperties: InfoProperties(
        mainLabelStyle: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: getProportionateScreenWidth(textSize),
        ),
      ),
    ),
  );
}
