assert = require 'assert'
# build a generator instance for us to use
gen    = require('../../lib')()

describe 'test generator', ->

  # test each order function
  describe 'order', ->

    it 'should have ordinal 1 for first', ->

      order = gen.first()
      assert.equal order.ordinal, 1

    it 'should have ordinal 2 for second', ->

      order = gen.second()
      assert.equal order.ordinal, 2

    it 'should have ordinal 3 for third', ->

      order = gen.third()
      assert.equal order.ordinal, 3

    it 'should have ordinal 4 for fourth', ->

      order = gen.fourth()
      assert.equal order.ordinal, 4

    it 'should have ordinal 5 for last', ->

      order = gen.last()
      assert.equal order.ordinal, 5

  # test each day function being called on generator
  # instead of after an order function
  describe 'day', ->

    it 'should have day 0 for sunday, and default ordinal 1', ->

      day = gen.sunday()
      assert.equal day.values.ordinal, 1, 'ordinal should be 1 by default'
      assert.equal day.values.day, 0, 'day should be 0'

    it 'should have day 1 for monday, and default ordinal 1', ->

      day = gen.monday()
      assert.equal day.values.ordinal, 1, 'ordinal should be 1 by default'
      assert.equal day.values.day, 1, 'day should be 1'

    it 'should have day 2 for tuesday, and default ordinal 1', ->

      day = gen.tuesday()
      assert.equal day.values.ordinal, 1, 'ordinal should be 1 by default'
      assert.equal day.values.day, 2, 'day should be 2'

    it 'should have day 3 for wednesday, and default ordinal 1', ->

      day = gen.wednesday()
      assert.equal day.values.ordinal, 1, 'ordinal should be 1 by default'
      assert.equal day.values.day, 3, 'day should be 3'

    it 'should have day 4 for thursday, and default ordinal 1', ->

      day = gen.thursday()
      assert.equal day.values.ordinal, 1, 'ordinal should be 1 by default'
      assert.equal day.values.day, 4, 'day should be 4'

    it 'should have day 5 for friday, and default ordinal 1', ->

      day = gen.friday()
      assert.equal day.values.ordinal, 1, 'ordinal should be 1 by default'
      assert.equal day.values.day, 5, 'day should be 5'

    it 'should have day 6 for saturday, and default ordinal 1', ->

      day = gen.saturday()
      assert.equal day.values.ordinal, 1, 'ordinal should be 1 by default'
      assert.equal day.values.day, 6, 'day should be 6'


    it 'should have day 0 for sunday and ordinal 2', ->

      day = gen.sunday 2
      assert.equal day.values.ordinal, 2, 'ordinal should be 2'
      assert.equal day.values.day, 0, 'day should be 0'

    it 'should have day 1 for monday and ordinal 2', ->

      day = gen.monday 2
      assert.equal day.values.ordinal, 2, 'ordinal should be 2'
      assert.equal day.values.day, 1, 'day should be 1'

    it 'should have day 2 for tuesday and ordinal 2', ->

      day = gen.tuesday 2
      assert.equal day.values.ordinal, 2, 'ordinal should be 2'
      assert.equal day.values.day, 2, 'day should be 2'

    it 'should have day 3 for wednesday and ordinal 2', ->

      day = gen.wednesday 2
      assert.equal day.values.ordinal, 2, 'ordinal should be 2'
      assert.equal day.values.day, 3, 'day should be 3'

    it 'should have day 4 for thursday and ordinal 2', ->

      day = gen.thursday 2
      assert.equal day.values.ordinal, 2, 'ordinal should be 2'
      assert.equal day.values.day, 4, 'day should be 4'

    it 'should have day 5 for friday and ordinal 2', ->

      day = gen.friday 2
      assert.equal day.values.ordinal, 2, 'ordinal should be 2'
      assert.equal day.values.day, 5, 'day should be 5'

    it 'should have day 6 for saturday, and default ordinal 1', ->

      day = gen.saturday 2
      assert.equal day.values.ordinal, 2, 'ordinal should be 2'
      assert.equal day.values.day, 6, 'day should be 6'

  # test month functions called after order and day functions
  describe 'month', ->

    it 'should have month 0 for january', ->

      order = gen.first()
      day   = order.sunday()
      month = day.january()
      assert.equal month.values.ordinal, 1, 'ordinal should be 1'
      assert.equal month.values.day, 0, 'day should be 0'
      assert.equal month.values.month, 0, 'month should be 0'

    it 'should have month 1 for february', ->

      order = gen.second()
      day   = order.monday()
      month = day.february()
      assert.equal month.values.ordinal, 2, 'ordinal should be 2'
      assert.equal month.values.day, 1, 'day should be 1'
      assert.equal month.values.month, 1, 'month should be 1'

    it 'should have month 2 for march', ->

      order = gen.third()
      day   = order.tuesday()
      month = day.march()
      assert.equal month.values.ordinal, 3, 'ordinal should be 3'
      assert.equal month.values.day, 2, 'day should be 2'
      assert.equal month.values.month, 2, 'month should be 2'

    it 'should have month 3 for april', ->

      order = gen.fourth()
      day   = order.wednesday()
      month = day.april()
      assert.equal month.values.ordinal, 4, 'ordinal should be 4'
      assert.equal month.values.day, 3, 'day should be 3'
      assert.equal month.values.month, 3, 'month should be 3'

    it 'should have month 4 for may', ->

      order = gen.last()
      day   = order.thursday()
      month = day.may()
      assert.equal month.values.ordinal, 5, 'ordinal should be 5'
      assert.equal month.values.day, 4, 'day should be 4'
      assert.equal month.values.month, 4, 'month should be 4'

    it 'should have month 5 for june', ->

      order = gen.first()
      day   = order.friday()
      month = day.june()
      assert.equal month.values.ordinal, 1, 'ordinal should be 1'
      assert.equal month.values.day, 5, 'day should be 5'
      assert.equal month.values.month, 5, 'month should be 5'

    it 'should have month 6 for july', ->

      order = gen.second()
      day   = order.saturday()
      month = day.july()
      assert.equal month.values.ordinal, 2, 'ordinal should be 2'
      assert.equal month.values.day, 6, 'day should be 6'
      assert.equal month.values.month, 6, 'month should be 6'

    it 'should have month 7 for august', ->

      order = gen.third()
      day   = order.sunday()
      month = day.august()
      assert.equal month.values.ordinal, 3, 'ordinal should be 3'
      assert.equal month.values.day, 0, 'day should be 0'
      assert.equal month.values.month, 7, 'month should be 7'

    it 'should have month 8 for september', ->

      order = gen.fourth()
      day   = order.monday()
      month = day.september()
      assert.equal month.values.ordinal, 4, 'ordinal should be 4'
      assert.equal month.values.day, 1, 'day should be 1'
      assert.equal month.values.month, 8, 'month should be 8'

    it 'should have month 9 for october', ->

      order = gen.last()
      day   = order.tuesday()
      month = day.october()
      assert.equal month.values.ordinal, 5, 'ordinal should be 5'
      assert.equal month.values.day, 2, 'day should be 2'
      assert.equal month.values.month, 9, 'month should be 9'

    it 'should have month 10 for november', ->

      order = gen.first()
      day   = order.wednesday()
      month = day.november()
      assert.equal month.values.ordinal, 1, 'ordinal should be 1'
      assert.equal month.values.day, 3, 'day should be 3'
      assert.equal month.values.month, 10, 'month should be 10'

    it 'should have month 11 for december', ->

      order = gen.second()
      day   = order.thursday()
      month = day.december()
      assert.equal month.values.ordinal, 2, 'ordinal should be 2'
      assert.equal month.values.day, 4, 'day should be 4'
      assert.equal month.values.month, 11, 'month should be 11'

    it 'should have month 5 in(5)', ->

      order = gen.second()
      day   = order.thursday()
      month = day.in(5)
      assert.equal month.values.ordinal, 2, 'ordinal should be 2'
      assert.equal month.values.day, 4, 'day should be 4'
      assert.equal month.values.month, 5, 'month should be 5'

  # test all the way thru to providing a year
  describe 'year', ->

    it 'should have first thursday in january of 2016', ->

      order = gen.first()
      day   = order.thursday()
      month = day.january()
      date  = month.of 2016
      assert.equal month.values.ordinal, 1, 'ordinal should be 1'
      assert.equal month.values.day, 4, 'day should be 4'
      assert.equal month.values.month, 0, 'month should be 0'

      assert.equal date.getFullYear(), 2016, 'should have year 2016'
      assert.equal date.getMonth(), 0, 'should have month 0'
      assert.equal date.getDate(), 7, 'should have day of month 7'

    it 'should have second thursday in january of 2016', ->

      order = gen.second()
      day   = order.thursday()
      month = day.january()
      date  = month.of 2016
      assert.equal month.values.ordinal, 2, 'ordinal should be 2'
      assert.equal month.values.day, 4, 'day should be 4'
      assert.equal month.values.month, 0, 'month should be 0'

      assert.equal date.getFullYear(), 2016, 'should have year 2016'
      assert.equal date.getMonth(), 0, 'should have month 0'
      assert.equal date.getDate(), 14, 'should have day of month 14'

    it 'should have third thursday in january of 2016', ->

      order = gen.third()
      day   = order.thursday()
      month = day.january()
      date  = month.of 2016
      assert.equal month.values.ordinal, 3, 'ordinal should be 3'
      assert.equal month.values.day, 4, 'day should be 4'
      assert.equal month.values.month, 0, 'month should be 0'

      assert.equal date.getFullYear(), 2016, 'should have year 2016'
      assert.equal date.getMonth(), 0, 'should have month 0'
      assert.equal date.getDate(), 21, 'should have day of month 21'

    it 'should have fourth thursday in january of 2016', ->

      order = gen.fourth()
      day   = order.thursday()
      month = day.january()
      date  = month.of 2016
      assert.equal month.values.ordinal, 4, 'ordinal should be 4'
      assert.equal month.values.day, 4, 'day should be 4'
      assert.equal month.values.month, 0, 'month should be 0'

      assert.equal date.getFullYear(), 2016, 'should have year 2016'
      assert.equal date.getMonth(), 0, 'should have month 0'
      assert.equal date.getDate(), 28, 'should have day of month 28'

    it 'should have last thursday in january of 2016', ->

      order = gen.last()
      day   = order.thursday()
      month = day.january()
      date  = month.of 2016
      assert.equal month.values.ordinal, 5, 'ordinal should be 5'
      assert.equal month.values.day, 4, 'day should be 4'
      assert.equal month.values.month, 0, 'month should be 0'

      assert.equal date.getFullYear(), 2016, 'should have year 2016'
      assert.equal date.getMonth(), 0, 'should have month 0'
      assert.equal date.getDate(), 28, 'should have day of month 28'


    it 'should have year 2016 for january(2016)', ->

      order = gen.second()
      day   = order.thursday()
      date = day.january 2016
      assert.equal day.values.ordinal, 2, 'ordinal should be 2'
      assert.equal day.values.day, 4, 'day should be 4'

      assert.equal date.getFullYear(), 2016, 'should have year 2016'
      assert.equal date.getMonth(), 0, 'should have month 0'
      assert.equal date.getDate(), 14, 'should have day of month 14'
