import 'package:flutter/material.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_colors.dart';
import 'package:nws_huydq_ecommerce_flutter/common/app_images.dart';

class ImageNetwork extends StatelessWidget {
  const ImageNetwork(
      {super.key,
      required this.imgUrl,
      required this.height,
      required this.width,
      required this.fit});

  final String imgUrl;
  final double height;
  final double width;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imgUrl,
      width: width,
      height: height,
      fit: fit,
      frameBuilder: (_, image, loadingBuilder, __) {
        if (loadingBuilder == null) {
          return SizedBox(
            height: height,
            child: const Center(
                child: CircularProgressIndicator(color: AppColors.secondary)),
          );
        }
        return image;
      },
      loadingBuilder: (BuildContext context, Widget image,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return image;
        return SizedBox(
          height: height,
          width: height,
          child: Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          ),
        );
      },
      errorBuilder: (_, __, ___) => Image.asset(
        AppImages.noImage,
        height: height,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
