import '../../index.dart';

class LoadingSpinner extends StatelessWidget {
  const LoadingSpinner({
    super.key,
    this.width = kLoadingSpinnerSize,
    this.height = kLoadingSpinnerSize,
    this.color = MyColors.midBlue,
  });

  final double width, height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
          color: color,
        ),
      ),
    );
  }
}
