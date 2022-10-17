_legendreNodes = """
  -0.98156063
  -0.90411726
  -0.76990267
  -0.58731795
  -0.3678315
  -0.12523341
  0.12523341
  0.3678315
  0.58731795
  0.76990267
  0.90411726
  0.98156063
  """
_legendreWeights = """
  0.04717534
  0.10693933
  0.16007833
  0.20316743
  0.23349254
  0.24914705
  0.24914705
  0.23349254
  0.20316743
  0.16007833
  0.10693933
  0.04717534
  """

legendreNodes = (parseFloat s for s in _legendreNodes.split(/\s/))
legendreWeights = (parseFloat s for s in _legendreWeights.split(/\s/))


adjustNodeToInterval = (x, a, b) ->
  return (x * (b - a)) / 2.0 + (b + a) / 2.0

adjustWeightToInterval = (w, a, b) ->
  return (w * (b - a)) / 2.0


export {
  legendreNodes,
  legendreWeights,
  adjustNodeToInterval,
  adjustWeightToInterval
}