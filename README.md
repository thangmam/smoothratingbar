A star rating with touch and swipe rate enabled.

* Supports half rate (with half-filled stars) and full rate (only full stars)
* Swipe for incrementing/decrementing rate amount
* Change star body and boundary colors independently
* Control size of the star rating
* Set your desired total Star count
* Supports click-to-rate

## Getting Started

Add the dependency in your Flutter project:
```
dependencies:
  ...
  smooth_star_rating: 1.0.2
```

## Usage example
```
import 'package:smooth_star_rating/smooth_star_rating.dart'; 
```

This widget doesn't take care of the state itself, so you'll need to store the
rating for it (just like how `Checkbox`es work).

In your state, simply add

```dart
double rating = 0;
```

and in your `build` method, you'll be able to use the widget like this:

```dart
SmoothStarRating(
  allowHalfRating: false,
  onRatingChanged: (v) {
    setState(() {
      rating = v;
    });
  },
  starCount: 5,
  rating: rating,
  size: 40,
  color: Colors.green,
  borderColor: Colors.green,
)
```

## Screenshots

### Full Rating
![alt text](https://raw.githubusercontent.com/thangmam/smoothratingbar/master/screenshots/fullrating.gif "Full rating")

### Half Rating
![alt text](https://raw.githubusercontent.com/thangmam/smoothratingbar/master/screenshots/halfrating.gif  "Half Rating")
