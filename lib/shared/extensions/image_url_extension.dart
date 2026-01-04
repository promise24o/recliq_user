import 'package:flutter/material.dart';
import '../../core/constants/image_paths.dart';

extension ImageUrlExtension on String {
  String withCacheBuster() {
    return '$this?t=${DateTime.now().millisecondsSinceEpoch}';
  }

  Widget toProfileImage({
    required double width,
    required double height,
    BoxFit fit = BoxFit.cover,
  }) {
    return ClipOval(
      child: Image.network(
        withCacheBuster(),
        width: width,
        height: height,
        fit: fit,
        // Prevent image caching
        cacheWidth: width.toInt(),
        cacheHeight: height.toInt(),
        headers: const {
          'Cache-Control': 'no-cache, no-store, must-revalidate',
          'Pragma': 'no-cache',
          'Expires': '0',
        },
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            ImagePaths.avatar,
            width: width,
            height: height,
            fit: fit,
          );
        },
      ),
    );
  }
}
