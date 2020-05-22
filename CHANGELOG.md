## [1.1.1] - 22/05/2020
### - isReadOnly property added.False by default

## [1.1.0+1] - 14/05/2020
### - Readme updated
### - Pubspec version increment
### - PR for Web support accepted.Thank you [NanoDashDev](https://github.com/NanoDashDev)
### - Intentional api change

## [1.1.0] - 14/05/2020
### - PR for Web support accepted.Thank you [NanoDashDev](https://github.com/NanoDashDev)
### - Intentional api change
``
onRatingChanged -> onRated
``

### WARNING: Since the widget is self updatable now,do not call setState on onRated.This could cause infinite loop.

### - onRated will be called only once for each rating action.For a rating value n , the onRated callback value when half star rating is enabled will be n.5 . Eg: 2.5,3.5 etc.Otherwise the onRated callback value will be n.

### - Version bumped up to 1.1.0

## [1.0.4+2] - 29/12/2019
### Bug fixed for issue #19 (Another exception was thrown: 'package:flutter/src/rendering/wrap.dart': Failed assertion: line 122 pos 15: 'spacing != null': is not true.)

## [1.0.4] - 26/12/2019
### Added support for replacing default stars icon
### The method 'toDouble' was called on null bug fixed

## [1.0.3] - 29/05/2019
### Added support for a spacing between stars

## [1.0.2] - 29/03/2019
### assertion added for checking nullability of rating variable which causes the exception "The method '_greaterThanFromInteger' was called on null."

## [1.0.1] - 21/11/2018
### Added click-to-rate feature

## [0.0.2] - 02/09/2018
### rating bug fixed


## [0.0.1] - 02/09/2018

### initial release.