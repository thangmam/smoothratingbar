library smooth_star_rating;

import 'package:flutter/material.dart';

class SmoothStarRating extends StatelessWidget {
  SmoothStarRating({
    this.starCount = 5,
    this.rating = 0.0,
    this.onRatingChanged,
    this.color,
    this.borderColor,
    this.size,
    this.allowHalfRating = true,
  })  : assert(starCount != null),
        assert(rating != null),
        assert(allowHalfRating != null);

  final int starCount;
  final double rating;
  final void Function(double rating) onRatingChanged;
  final Color color;
  final Color borderColor;
  final double size;
  final bool allowHalfRating;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Wrap(
        alignment: WrapAlignment.start,
        children: List.generate(starCount, (i) => _buildStar(context, i)),
      ),
    );
  }

  Widget _buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star_border,
        color: borderColor ?? Theme.of(context).primaryColor,
        size: size ?? 25,
      );
    } else if (allowHalfRating && index > rating - 1) {
      icon = Icon(
        Icons.star_half,
        color: color ?? Theme.of(context).primaryColor,
        size: size ?? 25,
      );
    } else {
      icon = Icon(
        Icons.star,
        color: color ?? Theme.of(context).primaryColor,
        size: size ?? 25,
      );
    }

    var ratingChangedCallback = onRatingChanged ?? (_) {};

    return GestureDetector(
      onTap: () => ratingChangedCallback(index + 1.0),
      onHorizontalDragUpdate: (dragDetails) {
        RenderBox box = context.findRenderObject();
        var pos = box.globalToLocal(dragDetails.globalPosition);
        var i = pos.dx / size;
        var newRating =
            (allowHalfRating ? i : i.roundToDouble()).clamp(0, starCount);
        ratingChangedCallback(newRating);
      },
      child: icon,
    );
  }
}
