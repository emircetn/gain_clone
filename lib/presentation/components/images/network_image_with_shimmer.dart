import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NetworkImageWithShimmer extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final double? aspectRatio;

  const NetworkImageWithShimmer(
    this.imageUrl, {
    Key? key,
    this.height,
    this.width,
    this.aspectRatio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return aspectRatio != null
        ? AspectRatio(
            aspectRatio: aspectRatio!,
            child: body(),
          )
        : body();
  }

  CachedNetworkImage body() {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      height: height,
      width: width,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[900]!,
        highlightColor: Colors.grey[600]!,
        child: Container(
          color: Colors.grey[600],
          height: height,
          width: width,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
