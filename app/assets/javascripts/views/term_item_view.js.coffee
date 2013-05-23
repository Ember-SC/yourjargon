YJ.TermItemView = Ember.View.extend(
  content: null
  click: (event) ->
    @get('controller').transitionToRoute('term', @get('content'))
  mouseEnter: (event) ->
    @set('hasFocus', true)
  mouseLeave: (event) ->
    @set('hasFocus', false)
  hasFocus: false
  description: Ember.computed ->
    description = @get('content.description')
    hasFocus = @get('hasFocus')
    maxLength = 100
    if hasFocus
      return description
    if description && description.length > maxLength
      description.slice(0, maxLength) + '...'
    else
      description
  .property('content.description', 'hasFocus')
)