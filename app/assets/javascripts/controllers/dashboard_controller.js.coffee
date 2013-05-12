YJ.UserDashboardController = Em.ObjectController.extend(
  content: null
  organizations: []
  setUser: ->
  	@set('content', YJ.get('currentUser'))
)
