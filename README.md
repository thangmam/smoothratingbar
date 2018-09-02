# smooth_star_rating 0.0.2

A Star rating with touch swipe enabled increment/decrement
* Supports half rate and full rate (1.0 or 0.5)
* Swipe for incrementing/decrementing rate amount
* Change star body and boundary colors independently
* Control size of the star rating
* Set your desired total Star count
## Getting Started

In your flutter project add the dependency:
```
    dependencies:
        ...
        smooth_star_rating: ^0.0.1
```

## Usage example
``` 
import 'package:smooth_star_rating/smooth_star_rating.dart'; 
``` 

```java 
StarRating(
          allowHalfRating: false,
          onRatingChanged: (v) {
            rating = v;
            setState(() {});
          },
          starCount: 5,
          rating: rating,
          size: 40.0,
          color: Colors.green,
          borderColor: Colors.green,
        )
```

## Constructor parameters
``` 
allowHalfRating                 -   Whether to use whole number for rating(1.0  or 0.5)
onRatingChanged(int rating)     -   Rating changed callback
starCount                       -   The maximum amount of stars
rating                          -   The current value of rating
size                            -   The size of a single star
color                           -   The body color of star
borderColor                     -   The border color of star
```
