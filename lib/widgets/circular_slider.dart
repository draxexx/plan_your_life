import '../index.dart';

SleekCircularSlider circularSlider(
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
        trackWidth: 15,
        progressBarWidth: 10,
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
