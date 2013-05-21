YJ.TermsNewController = Ember.Controller.extend(
  needs: ['organization']
  organizationBinding: 'controllers.organization.content'
  name: null
  description: null

  addTerm: ->
  	if @get('description') is null
  		@get('organization').publishUndefinedTerm(@get('name'))
  	else
  		@get('organization').publishDefinedTerm(@get('name'), @get('description'))

  cancel: ->
    @set('name', null)
    @set('description', null)
)