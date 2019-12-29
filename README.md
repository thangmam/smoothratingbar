
A Star rating with touch and swipe rate enabled
* Supports replacing default star icons with desired IconData
* Supports half rate and full rate (1.0 or 0.5)
* Swipe for incrementing/decrementing rate amount
* Change star body and boundary colors independently
* Control size of the star rating
* Set your desired total Star count
* Supports click-to-rate
* Spacing between stars

## Getting Started

In your flutter project add the dependency:
```
    dependencies:
        ...
        smooth_star_rating: 1.0.4+2
```

## Usage example
``` 
import 'package:smooth_star_rating/smooth_star_rating.dart'; 
``` 

```java 
SmoothStarRating(
          allowHalfRating: false,
          onRatingChanged: (v) {
            rating = v;
            setState(() {});
          },
          starCount: 5,
          rating: rating,
          size: 40.0,
          filledIconData: Icons.blur_off,
          halfFilledIconData: Icons.blur_on,
          color: Colors.green,
          borderColor: Colors.green,
          spacing:0.0
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
spacing                         -   Spacing between stars(default is 0.0)
filledIconData                  -   Full Rated Icon
halfFilledIconData              -   Half Rated Icon
defaultIconData                 -   Default Rated Icon
```

### Screenshots

#### Full Rating
![alt text](https://raw.githubusercontent.com/thangmam/smoothratingbar/master/screenshots/fullrating.gif "Full rating")

#### Half Rating

![alt text](https://raw.githubusercontent.com/thangmam/smoothratingbar/master/screenshots/halfrating.gif  "Half Rating")

### MIT LICENSE

### Let me know if you find any bugs/issues.Thanks.
 [<img src="https://camo.githubusercontent.com/d5d24e33e2f4b6fe53987419a21b203c03789a8f/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f446f6e6174652d50617950616c2d677265656e2e737667">](https://www.paypal.me/thangmam)