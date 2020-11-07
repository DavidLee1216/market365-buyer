import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final double height;
  final String url;
  final bool rounded;

  CachedImage({this.height, this.url, @required this.rounded});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(rounded ? 5 : 0),
      child: CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
        height: height,
        width: height,
        placeholder: (context, url) => Image.asset('assets/images/dummy.png', height: height),
        errorWidget: (context, url, error) => Image.asset('assets/images/dummy.png', height: height),
      ),
    );
  }
}
