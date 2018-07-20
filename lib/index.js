// Generator starts things as an order (first, etc), or a day with an order.
// it moves on to Order, Day, and finally Month.
// they hold their values, so, they can be held onto and reused.

class Generator {
  constructor() {}

  first()  { return new Order(1) }
  second() { return new Order(2) }
  third()  { return new Order(3) }
  fourth() { return new Order(4) }
  last()   { return new Order(5) }

  sunday(ordinal = 1)    { return new Day(ordinal, 0) }
  monday(ordinal = 1)    { return new Day(ordinal, 1) }
  tuesday(ordinal = 1)   { return new Day(ordinal, 2) }
  wednesday(ordinal = 1) { return new Day(ordinal, 3) }
  thursday(ordinal = 1)  { return new Day(ordinal, 4) }
  friday(ordinal = 1)    { return new Day(ordinal, 5) }
  saturday(ordinal = 1)  { return new Day(ordinal, 6) }

}


// represents first, second, etc and allows specifying a day
class Order {

  constructor(ordinal) { this.ordinal = ordinal }

  sunday()    { return new Day(this.ordinal, 0) }
  monday()    { return new Day(this.ordinal, 1) }
  tuesday()   { return new Day(this.ordinal, 2) }
  wednesday() { return new Day(this.ordinal, 3) }
  thursday()  { return new Day(this.ordinal, 4) }
  friday()    { return new Day(this.ordinal, 5) }
  saturday()  { return new Day(this.ordinal, 6) }

}

// represents sunday-saturday (with day and ordinal), allows specifying a month
class Day {
  constructor(ordinal, day) {
    this.ordinal = ordinal
    this.day     = day
  }

  _month(monthNumber, year) {
    var month = new Month(this.ordinal, this.day, monthNumber)

    // if they specified the year then use it
    return year ? month.of(year) : month
  }

  in(month) { // if they specified the month as a number then use it
    return month ? this._month(month) : this
  }

  month(month) { return this._month(month) }

  january(year)   { return this._month(0, year) }
  february(year)  { return this._month(1, year) }
  march(year)     { return this._month(2, year) }
  april(year)     { return this._month(3, year) }
  may(year)       { return this._month(4, year) }
  june(year)      { return this._month(5, year) }
  july(year)      { return this._month(6, year) }
  august(year)    { return this._month(7, year) }
  september(year) { return this._month(8, year) }
  october(year)   { return this._month(9, year) }
  november(year)  { return this._month(10, year) }
  december(year)  { return this._month(11, year) }

}

// represents the month (with day and ordinal) and accepts the year
class Month {
  constructor(ordinal, day, month) {
    this.ordinal = ordinal
    this.day     = day
    this.month   = month
  }

  of(year) { // calculate the date and return it
    // 1. start at the first day of the month
    const date = new Date(year, this.month, 1)

    // 2. how many days from there to the day of the week we want?
    //
    // 'day' means 'day of the week', like Monday(1) is day 1.
    //
    // find the number of days to the first of the desired day (0-6).
    // what day is the first day, and how many days until the day we want?
    // if the first day of the month is the day we want, then we're there.
    // for the other days we need to add from 1 to 6 to get to its first day.
    // to determine which number (1-6) to use, calculate the diff:
    //   diff = targetDay - firstOfMonth.day
    //   4    = friday(5) - monday(1)    // target is 4 days later
    //
    //   if `diff` is negative, then add it to '7' to get the number.
    //   7 + -2   = tuesday(2) - thursday(4) // target is 5 days later
    //
    // these two steps accomplish the above:
    var days = this.day - date.getDay()
    if (days < 0) {
      days = 7 + days
    }

    // 3. calculate if we need to add more days to get to the desired week.
    //
    // if they want the first occurrence of the month then the ordinal is 1.
    // we don't want to add any extra days to get to a later week, so, when
    // multiplying the ordinal times 7 (7 days in a week) we want to get zero.
    // so, we subtract 1 from the ordinal.
    // then, if they want a later week, the ordinal (minus 1) multiplied by 7
    // tells us how many extra days to add.
    // so, if they want the third one, then it's: daysToFirstDay + ((3 - 1) * 7)
    // so, if it's 2 days to the day they want then: 2 + ((3 - 1) * 7) = 16
    //
    // then we add that number of days to the date.
    date.setDate(date.getDate() + days + ((this.ordinal - 1) * 7))

    // 4. ensure we didn't end up in the next month.
    //
    // if ordinal is 5, then they want the last one, which may be before the
    // fifth one, so, need a little extra calculation then...
    //
    // I'm going to check if we ended up in the next month.
    // if so, then I'll backup a week to be on the right day in the right month.
    if (date.getMonth() !== this.month) {
      date.setDate(date.getDate() - 7)
    }

    // 5. now the date has been moved to the right day in the month
    return date
  }

}

module.exports = function() {
  return new Generator()
}

module.exports.Generator = Generator
