import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CachedNetworkImageComponent extends StatelessWidget {
  const CachedNetworkImageComponent({Key? key, required this.imageUri})
      : super(key: key);
  final String imageUri;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: imageUri,
        placeholder: (context, url) => Center(
              child: CircularProgressIndicator(
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
        errorWidget: (context, url, error) => Icon(
              Icons.error,
              size: 22.r,
            ),
        fit: BoxFit.cover);
  }
}
