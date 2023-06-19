import '../index.dart';

Future<void> showCustomDialog(
  Widget dialog, {
  bool barrierDismissible = false,
}) {
  return showDialog(
    barrierDismissible: barrierDismissible,
    context: Get.context as BuildContext,
    builder: (BuildContext context) {
      return dialog;
    },
  );
}
