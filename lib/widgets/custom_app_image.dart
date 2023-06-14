import '../../index.dart';

class CustomAppImage extends StatelessWidget {
  const CustomAppImage({
    super.key,
    this.isSvgImage = false,
    this.isNetworkImage = false,
    this.imgUrl = '',
    this.imgHeight,
    this.imgWidth,
    this.imgFit = BoxFit.contain,
    this.imgAlignment = const Alignment(0, 0),
    this.color,
    this.isLoading = false,
  });

  final bool isSvgImage, isNetworkImage;
  final String imgUrl;
  final double? imgWidth, imgHeight;
  final BoxFit imgFit;
  final Color? color;
  final Alignment imgAlignment;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (isSvgImage) {
      return SvgPicture.asset(
        imgUrl,
        placeholderBuilder: (_) => const LoadingSpinner(),
        width: imgWidth != null ? getProportionateScreenWidth(imgWidth!) : null,
        fit: imgFit,
        // ignore: deprecated_member_use
        color: color,
      );
    }
    if (isNetworkImage) {
      return Image.network(
        imgUrl,
        width: imgWidth != null ? getProportionateScreenWidth(imgWidth!) : null,
        height:
            imgHeight != null ? getProportionateScreenWidth(imgHeight!) : 100,
        alignment: imgAlignment,
        fit: imgFit,
        errorBuilder: (context, error, stackTrace) => Image.asset(
          "assets/images/man-profile.png",
          width:
              imgWidth != null ? getProportionateScreenWidth(imgWidth!) : null,
          height:
              imgHeight != null ? getProportionateScreenWidth(imgHeight!) : 100,
          alignment: imgAlignment,
          fit: imgFit,
        ),
        loadingBuilder: (context, child, loadingProgress) =>
            isLoading ? const CircularProgressIndicator() : child,
      );
    }
    return Image.asset(
      imgUrl,
      width: imgWidth != null ? getProportionateScreenWidth(imgWidth!) : null,
      height: imgHeight != null ? getProportionateScreenWidth(imgHeight!) : 100,
      alignment: imgAlignment,
      fit: imgFit,
    );
  }
}
