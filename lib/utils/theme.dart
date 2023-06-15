import '../index.dart';

ThemeData blueTheme() {
  return ThemeData(
    fontFamily: "Lato",
    primaryColor: MyColors.midBlue,
    primaryColorDark: MyColors.darkBlue,
    primaryColorLight: MyColors.blue,
    scaffoldBackgroundColor: MyColors.white,
    hintColor: MyColors.white,
    dialogBackgroundColor: MyColors.midBlue20,
    disabledColor: MyColors.grayLight,
    unselectedWidgetColor: MyColors.white60,
  );
}

// ThemeData darkTheme() {
//   return ThemeData(
//     fontFamily: "OpenSans",
//     primaryColor: black,
//     accentColor: white,
//     scaffoldBackgroundColor: white,
//   );
// }
