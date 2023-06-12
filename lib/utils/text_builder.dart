import '../index.dart';

// returns a custom text widget according to a given parameters
Widget textBuilder(
  String text, {
  Color? color,
  double? fontSize,
  double? lineHeight,
  double? letterSpacing,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  TextOverflow? overflow,
  TextType textType = TextType.defaultText,
  TextDecoration textDecoration = TextDecoration.none,
  List<Shadow>? shadows,
}) {
  return CustomText(
    text: text,
    color: color ?? MyColors.black,
    fontSize: fontSize ?? _textParameter(textType).fontSize,
    lineHeight: lineHeight ?? _textParameter(textType).lineHeight,
    letterSpacing: letterSpacing ?? _textParameter(textType).letterSpacing,
    fontWeight: fontWeight ?? _textParameter(textType).fontWeight,
    textAlign: textAlign ?? TextAlign.left,
    overflow: overflow ?? TextOverflow.clip,
    textDecoration: textDecoration,
    shadows: shadows,
  );
}

// returns TextParameterModel according to TextType
// TextParameterModel contains fontSize, lineHeight, letterSpacing and, fontWeight
TextParameterModel _textParameter(TextType textType) {
  switch (textType) {
    case TextType.header_1:
      return const TextParameterModel(
        fontSize: 20,
        lineHeight: 0,
        letterSpacing: 1,
        fontWeight: FontWeight.w700,
      );
    case TextType.header_2:
      return const TextParameterModel(
        fontSize: 35,
        lineHeight: 0,
        letterSpacing: 1,
        fontWeight: FontWeight.w700,
      );
    case TextType.header_3:
      return const TextParameterModel(
        fontSize: 18,
        lineHeight: 0,
        letterSpacing: 1,
        fontWeight: FontWeight.w700,
      );
    case TextType.header_4:
      return const TextParameterModel(
        fontSize: 45,
        lineHeight: 0,
        letterSpacing: 1,
        fontWeight: FontWeight.w900,
      );
    case TextType.body_1:
      return const TextParameterModel(
        fontSize: 10,
        lineHeight: 0,
        letterSpacing: 1,
        fontWeight: FontWeight.w400,
      );
    case TextType.subText1:
      return const TextParameterModel(
        fontSize: 15,
        lineHeight: 0,
        letterSpacing: 1,
        fontWeight: FontWeight.w300,
      );
    case TextType.subText2:
      return const TextParameterModel(
        fontSize: 10,
        lineHeight: 0,
        letterSpacing: 1,
        fontWeight: FontWeight.w300,
      );
    case TextType.textButton:
      return const TextParameterModel(
        fontSize: 10,
        lineHeight: 0,
        letterSpacing: 1,
        fontWeight: FontWeight.w400,
      );
    case TextType.buttonText:
      return const TextParameterModel(
        fontSize: 16,
        lineHeight: 0,
        letterSpacing: 1,
        fontWeight: FontWeight.w700,
      );
    case TextType.defaultText:
      return const TextParameterModel(
        fontSize: 10,
        lineHeight: 0,
        letterSpacing: 1,
        fontWeight: FontWeight.w400,
      );
    default:
      return const TextParameterModel(
        fontSize: 10,
        lineHeight: 0,
        letterSpacing: 1,
        fontWeight: FontWeight.w400,
      );
  }
}
