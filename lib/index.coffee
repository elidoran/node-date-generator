# Generator starts things as an order (first, etc), or a day with an order.
# it moves on to Order, Day, and finally Month.
# they hold their values, so, they can be held onto and reused.

class Generator

  constructor: ->

  _order: (ordinal) -> new Order ordinal

  first : -> @_order 1
  second: -> @_order 2
  third : -> @_order 3
  fourth: -> @_order 4
  last  : -> @_order 5

  _day: (ordinal, day) -> new Day ordinal:ordinal, day:day

  sunday   : (ordinal = 1) -> @_day ordinal, 0
  monday   : (ordinal = 1) -> @_day ordinal, 1
  tuesday  : (ordinal = 1) -> @_day ordinal, 2
  wednesday: (ordinal = 1) -> @_day ordinal, 3
  thursday : (ordinal = 1) -> @_day ordinal, 4
  friday   : (ordinal = 1) -> @_day ordinal, 5
  saturday : (ordinal = 1) -> @_day ordinal, 6

# represents first, second, etc and allows specifying a day
class Order

  constructor: (@ordinal) ->

  _day: (day) -> new Day ordinal:@ordinal, day:day

  sunday   : -> @_day 0
  monday   : -> @_day 1
  tuesday  : -> @_day 2
  wednesday: -> @_day 3
  thursday : -> @_day 4
  friday   : -> @_day 5
  saturday : -> @_day 6

# represents sunday-saturday (with day and ordinal), allows specifying a month
class Day

  constructor: (@values) ->

  _month: (month, year) ->
    values = {}
    values[key] = value for key,value of @values
    values.month = month
    month = new Month values
    if year? then month.of year else month

  in: (month) ->
    # they specified the month as a number, so use it
    if month? then @_month month
    # return self, this is just to help readability
    else this

  month: (month) -> @_month month

  january  : (year) -> @_month 0, year
  february : (year) -> @_month 1, year
  march    : (year) -> @_month 2, year
  april    : (year) -> @_month 3, year
  may      : (year) -> @_month 4, year
  june     : (year) -> @_month 5, year
  july     : (year) -> @_month 6, year
  august   : (year) -> @_month 7, year
  september: (year) -> @_month 8, year
  october  : (year) -> @_month 9, year
  november : (year) -> @_month 10, year
  december : (year) -> @_month 11, year

# represents the month (with day and ordinal) and accepts the year
class Month

  constructor: (@values) ->

  of: (year) -> # calculate the date and return it

    # start at the first day of the month
    date = new Date year, @values.month, 1

    # what day is the first day, and how many days until the day we want?
    # if we want sunday(0), and it *is* sunday(0), the diff is zero.
    # so, diff of zero means we're at the one we want.
    # if it's a few days in the future, then, the diff is positive
    # if it's negative then we need to do: (7 + diff)
    # if we want wednesday(3) and it's monday(1), the diff is 2, so, 2 days to first day
    # so, if we want tuesday(2) and it's thursday(4), then the diff is -2
    # so, calculation is: (7 + -2)  = 5   so, 5 days later is the first day
    days = @values.day - date.getDay()
    if days < 0 then days = (7 + days)

    # if they want the first one, the ordinal is 1, and the daysToFirstDay
    # is where that is. we subtract 1, which makes first become 0, and 0 * 7 = 0
    # if they want second or after, then multiply 7 times 1 less than the ordinal.
    # so, if they want the third one, then it's: daysToFirstDay + ((3 - 1) * 7)
    # so, if it's 2 days to the day they want then: 2 + ((3 - 1) * 7) = 16

    # we add that value to the date
    date.setDate date.getDate() + days + ((@values.ordinal - 1) * 7)

    # TODO:
    #  if ordinal is 5, then they want the last one, which may be before the
    #  fifth one, so, need a little extra calculation then
    if date.getMonth() isnt @values.month # then we went too far, so, backup :)
      date.setDate date.getDate() - 7

    # now the date has been moved to the right day in the month
    return date


module.exports = -> new Generator
exports.Generator = Generator
