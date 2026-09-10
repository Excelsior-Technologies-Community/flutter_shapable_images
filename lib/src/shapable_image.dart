import 'package:flutter/material.dart';
import 'image_shape.dart';

class ShapableImage extends StatelessWidget {
  final String? imageUrl;
  final String? assetPath;
  final double? width;
  final double? height;
  final ImageShape shape;
  final double borderRadius;
  final double borderWidth;
  final Color borderColor;
  final BoxFit fit;
  final Alignment alignment;
  final Widget? placeholder;
  final Widget? errorWidget;

  const ShapableImage({
    super.key,
    this.imageUrl,
    this.assetPath,
    this.width,
    this.height,
    this.shape = ImageShape.circle,
    this.borderRadius = 12,
    this.borderWidth = 0,
    this.borderColor = Colors.transparent,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.topCenter,
    this.placeholder,
    this.errorWidget,
  })  : assert(
  imageUrl != null || assetPath != null,
  'Either imageUrl or assetPath must be provided.',
  ),
        assert(
        borderWidth >= 0,
        'borderWidth must not be negative.',
        ),
        assert(
        borderRadius >= 0,
        'borderRadius must not be negative.',
        );

  @override
  Widget build(BuildContext context) {
    final imageProvider = getImageProvider();

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: shape == ImageShape.circle
            ? BoxShape.circle
            : BoxShape.rectangle,
        borderRadius: getBorderRadius(),
        border: borderWidth > 0
            ? Border.all(
          width: borderWidth,
          color: borderColor,
        )
            : null,
      ),
      clipBehavior: Clip.antiAlias,
      child: imageProvider == null
          ? buildPlaceholder()
          : Image(
        image: imageProvider,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        errorBuilder: (context, error, stackTrace) {
          return buildErrorWidget();
        },
      ),
    );
  }

  ImageProvider<Object>? getImageProvider() {
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return NetworkImage(imageUrl!);
    }

    if (assetPath != null && assetPath!.isNotEmpty) {
      return AssetImage(assetPath!);
    }

    return null;
  }

  BorderRadius? getBorderRadius() {
    if (shape == ImageShape.roundedRectangle) {
      return BorderRadius.circular(borderRadius);
    }

    return null;
  }

  Widget buildPlaceholder() {
    return placeholder ??
        const Center(
          child: Icon(Icons.image_outlined),
        );
  }

  Widget buildErrorWidget() {
    return errorWidget ??
        const Center(
          child: Icon(Icons.broken_image_outlined),
        );
  }
}