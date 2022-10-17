import sum from 'mathjs'
import {
  adjustNodeToInterval,
  adjustWeightToInterval,
  legendreWeights,
  legendreNodes
} from "./legendre.js"

quadratureLegendreGauss = (f, a = 0, b = 1) ->
  xx = (adjustNodeToInterval x, a, b for x in legendreNodes)
  ww = (adjustWeightToInterval w, a, b for w in legendreWeights)
  return sum(f(xx[i]) * ww[i] for i in [0..xx.length-1])

export { quadratureLegendreGauss }