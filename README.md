# @date/generator
[![Build Status](https://travis-ci.org/elidoran/node-date-generator.svg?branch=master)](https://travis-ci.org/elidoran/node-date-generator)
[![npm version](https://badge.fury.io/js/%40date%2Fgenerator.svg)](http://badge.fury.io/js/%40date%2Fgenerator)
[![Coverage Status](https://coveralls.io/repos/github/elidoran/node-date-generator/badge.svg?branch=master)](https://coveralls.io/github/elidoran/node-date-generator?branch=master)

Generate dates with readable function chaining.

Also has functions accepting numbers to help with using values provided from elsewhere.

## Install

```sh
npm install @date/generator --save
```

## Usage


```javascript
var gen = require('@date/generator')

// these are equivalent:
//   specify each thing individually
var washingtonDay = gen.third().monday().in().february().of(2016)
//   skip the in() and of() and specify the year in the february() call
var washingtonDay = gen.third().monday().february(2016)
//   specify 'third' with a '3' to monday(),
//           'february' with '1' to month()
var washingtonDay = gen.monday(3).month(1).of(2016)

var thanksgiving  = gen.fourth().thursday().in().november().of(2016)
```

## Order

Start with the order functions:

1. `first()` - 1
2. `second()` - 2
3. `third()` - 3
4. `fourth()` - 4
5. `last()` - 5 (will be last, even when last is the fourth)


## Days

Day functions are available after calling an order function, or, start with them and specify the order value as 1-5:

1. `sunday()`
2. `monday()`
3. `tuesday()`
4. `wednesday()`
5. `thursday()`
6. `friday()`
7. `saturday()`


## Months

Month functions are available after calling a day function:

1. `january()`
2. `february()`
3. `march()`
4. `april()`
5. `may()`
6. `june()`
7. `july()`
8. `august()`
9. `september()`
10. `october()`
11. `november()`
12. `december()`


Also, shortcut making a call to `of(year)` after it and specify the year in the month call, like `august(2016)`.

## Years

Last call specifies the year to function `of(year)` and returns a Date instance.

## [MIT License](LICENSE)
