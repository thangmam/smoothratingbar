library smooth_star_rating;

import 'package:flutter/material.dart';

typedef RatingChangeCallback = void Function(double rating);

class SmoothStarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback? onRatingChanged;
  final Color? color;
  final Color? borderColor;
  final double size;
  final bool allowHalfRating;
  final IconData? filledIconData;
  final IconData? halfFilledIconData;
  final IconData?
      defaultIconData; //this is needed only when having fullRatedIconData && halfRatedIconData
  final double spacing;
  const SmoothStarRating({
    Key? key,
    this.starCount = 5,
    this.spacing = 0.0,
    this.rating = 0.0,
    this.defaultIconData,
    this.onRatingChanged,
    this.color,
    this.borderColor,
    this.size = 25,
    this.filledIconData,
    this.halfFilledIconData,
    this.allowHalfRating = true,
  }) : super(key: key);

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    final key = ValueKey('star${index + 1}');
    if (index >= rating) {
      icon = Icon(
        defaultIconData ?? Icons.star_border,
        key: key,
        color: borderColor ?? Theme.of(context).primaryColor,
        size: size,
      );
    } else if (index > rating - (allowHalfRating ? 0.5 : 1.0) &&
        index.toDouble() < rating) {
      icon = Icon(
        halfFilledIconData ?? Icons.star_half,
        key: key,
        color: color ?? Theme.of(context).primaryColor,
        size: size,
      );
    } else {
      icon = Icon(
        filledIconData ?? Icons.star,
        key: key,
        color: color ?? Theme.of(context).primaryColor,
        size: size,
      );
    }

    return GestureDetector(
      onTap: () {
        onRatingChanged?.call(index + 1.0);
      },
      onHorizontalDragUpdate: (dragDetails) {
        final box = context.findRenderObject()! as RenderBox;
        final _pos = box.globalToLocal(dragDetails.globalPosition);
        final i = _pos.dx / size;
        var newRating = allowHalfRating ? i : i.round().toDouble();
        if (newRating > starCount) {
          newRating = starCount.toDouble();
        }
        if (newRating < 0) {
          newRating = 0.0;
        }
        onRatingChanged?.call(newRating);
      },
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Wrap(
        spacing: spacing,
        children:
            List.generate(starCount, (index) => buildStar(context, index)),
      ),
    );
  }
}
