import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileImageWidget extends StatelessWidget {
  final File? localFile;
  final String? networkUrl;
  final double size;
  final String placeholder;

  const ProfileImageWidget({
    super.key,
    this.localFile,
    this.networkUrl,
    this.size = 100,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    Widget image;

    if (localFile != null) {
      // 1️⃣ Local image (picked by user)
      image = Image.file(localFile!, fit: BoxFit.cover);
    } else if (networkUrl != null && networkUrl!.isNotEmpty) {
      // 2️⃣ Network image
      image = CachedNetworkImage(
        imageUrl: networkUrl!,
        fit: BoxFit.cover,
        placeholder: (context, url) =>
            Image.asset(placeholder, fit: BoxFit.cover),
        errorWidget: (context, url, error) =>
            Image.asset(placeholder, fit: BoxFit.cover),
      );
    } else {
      // 3️⃣ Placeholder
      image = Image.asset(placeholder, fit: BoxFit.cover);
    }

    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipOval(child: image),
    );
  }
}
