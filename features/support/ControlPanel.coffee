class ControlPanel
  constructor: ->
    @message = ''

  signMessage: ->
    @message

  deactivateSign: ->
    @message = ''

  pressButton: ->
    @message = 'Please do not press this button again asshole'

exports.ControlPanel = ControlPanel