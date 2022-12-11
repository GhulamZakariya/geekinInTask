import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nex_gen_task/designExtentions/images.dart';
import '../../designExtentions/colors.dart';

class ImageWidget extends StatelessWidget {
  final String url;
  final bool isAsset;
  final double height;
  final double width;
  final BoxFit fit;
  final double? radius;
  final Color? color;

  const ImageWidget(
      {Key? key,
      required this.url,
      required this.height,
      required this.width,
      required this.fit,
      required this.isAsset,
      this.color,
      this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isAsset
        ? Image.asset(
            url,
            height: height,
            width: width,
            fit: fit,
            color: color,
          )
        : AspectRatio(
            aspectRatio: width / height,
            child: CachedNetworkImage(
              imageUrl: url,
              imageBuilder: (context, imageProvider) => Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius ?? 0),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: fit,
                  ),
                ),
              ),
              placeholder: (context, url) => const Center(
                child: SizedBox(
                    height: 40,
                    width: 40,
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    )),
              ),
              errorWidget: (context, url, error) => Image.asset(
                AppImages.placeholder,
                fit: BoxFit.cover,
              ),
            ),
          );
  }
}
