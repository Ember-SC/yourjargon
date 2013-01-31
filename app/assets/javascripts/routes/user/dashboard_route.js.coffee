YJ.UserDashboardRoute = Ember.Route.extend(
  events:
    createOrg: ((event) ->
      @transitionTo('organizations.new')
    )

    joinOrg: ((event) ->
      # should join the organization that is passed in the context
      # org = event.context
      # controller.transitionTo('organizations.index')
    )

    toOrg: ((event) ->
      @transitionTo('organizations.organization.show', event.context)
    )

  enter: ->
    if YJ.get('currentUser')
      console.log("i'm in your dashboard outlets " + YJ.get('currentUser'))
    else
      @send('checkUser')


  setupController: ( (controller, model) ->
    controller.set('content', YJ.get('currentUser'))
  )
)