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

  /// The maximum amount of stars.
  final int starCount;

  /// The rating itself.
  ///
  /// Caution: This widget doesn't take care of the state itself, so you'll need
  /// to store the rating for it (just like how `Checkbox`es work).
  ///
  /// Example:
  /// ```dart
  /// ...
  /// _MyWidgetState extends State<MyWidget> {
  ///   double rating = 0;
  ///
  ///   @override
  ///   Widget build(BuildContext context) {
  ///     return SmoothStarRating(
  ///       onRatingChanged: (r) {
  ///         setState(() {
  ///           rating = r;
  ///         });
  ///       },
  ///       rating: rating,
  ///     )
  ///   }
  /// }
  /// ```
  final double rating;

  /// A callback for when the rating is changed.
  final void Function(double rating) onRatingChanged;

  /// The color of the filled and half-filled stars.
  final Color color;

  /// The color of empty stars.
  final Color borderColor;

  /// The size of the stars.
  final double size;

  /// Whether to allow the user to give rate using half stars.
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
        var newRating = (allowHalfRating ? i : i.roundToDouble())
            .clamp(0.0, starCount.toDouble());
        ratingChangedCallback(newRating);
      },
      child: icon,
    );
  }
}
