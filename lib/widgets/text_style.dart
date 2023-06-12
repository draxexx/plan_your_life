import '../index.dart';

Text contentText(BuildContext context, String text, bool translate, Color color,
    double size) {
  return Text(
    translate ? AppLocalizations.of(context).translate(text) : text,
    style: TextStyle(
      color: color,
      fontSize: getProportionateScreenWidth(size),
      fontWeight: FontWeight.bold,
      shadows: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10,
          offset: Offset(0, 5),
        ),
      ],
    ),
  );
}

Text headerText(BuildContext context, String text, bool translate, Color color,
    double size) {
  return Text(
    translate ? AppLocalizations.of(context).translate(text) : text,
    style: TextStyle(
      color: color,
      fontSize: getProportionateScreenWidth(size),
      fontWeight: FontWeight.bold,
    ),
  );
}

Text subText(BuildContext context, String text, bool translate) {
  return Text(
    translate ? AppLocalizations.of(context).translate(text) : text,
    style: TextStyle(
      color: MyColors.black,
      fontSize: getProportionateScreenWidth(15),
    ),
  );
}
