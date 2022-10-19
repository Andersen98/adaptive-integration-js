###
maeve\adaptive-integration-js

Licensed under the MIT license
For full copyright and license information, please see the LICENSE file

@author     Maeve Andersen <maeve.andersen@colorado.edu>
@copyright  2022 Maeve Andersen
@link       https://github.com/andersen98/adaptive-integrator-js
@license    http://choosealicense.com/licenses/MIT  MIT License
###
assert = require 'assert'
quadrature = require '../src/quadratures'
Ag = require 'algebrite'
math = require 'mathjs'

describe 'Quadrature Test Suite', ->
  # Pre-define some variables to be available within the whole suite
  #create a mathj where epsilon=.001
  mathApprox = math.create math.all, epsilon: 1e-3
  String::removeTrailDots = ->
    return this.replace /[.]{2,}$/g, ''
  f = (x) -> return x * x
  fString = 'x^2'
  integralF = (a, b) ->
    resultStr = Ag.run "float(defint(#{fString},x,#{a},#{b}))"
    return parseFloat resultStr.removeTrailDots()
  a0 = -1
  b0 = 1
  a1 = -1
  b1 = 0.0

  describe '#quadrature() method', ->
    describe '#quadratureLegendreGauss() method', ->
    # A test case
    it 'numerically integrate f(x) on [a,b]', ->
      expected = integralF a0, b0
      actual = quadrature.quadratureLegendreGauss f, a0, b0
      assert.ok mathApprox.equal expected, actual

    it 'works on first half interval of [a,(b+a)/2]', ->
      expected1 = integralF a1, b1
      actual1 = quadrature.quadratureLegendreGauss f, a1, b1
      assert.ok(
        mathApprox.equal expected1, actual1
        "Expected: #{expected1}, Actual: #{actual1}"
      )

    it 'works on second half interval of [(b0+a0)/2,b0]', ->
      expected1 = integralF (b0 + a0) / 2, b0
      actual1 = quadrature.quadratureLegendreGauss f, (b0 + a0) / 2, b0
      assert.ok(
        mathApprox.equal expected1, actual1
        "Expected: #{expected1}, Actual: #{actual1}"
      )
