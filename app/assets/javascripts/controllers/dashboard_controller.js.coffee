YJ.DashboardController = Em.ObjectController.extend(
  content: null
  organizations: []
  setUser: ->
  	@set('content', YJ.get('currentUser'))
)
