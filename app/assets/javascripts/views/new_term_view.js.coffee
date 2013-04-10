###
  @class

  The view for the new term edit window
###
YJ.NewTermView = Em.View.extend(

  didInsertElement: ->
    @_super()
    @$('input:first').focus()
)
