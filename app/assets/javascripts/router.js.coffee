YJ.Router = Ember.Router.extend(
  enableLogging: true
  location: 'hash'
  #states defined under /states folder

  root: Ember.State.extend(
    # EVENTS


    index: Ember.State.extend(
      route: '/'

      connectOutlets: (router) ->
        console.log("connecting outlets")
        appController = router.get('applicationController')
        console.log(appController)
        appController.connectOutlet(YJ.MainView)

      newTerm: Ember.State.transitionTo('new')
    )

    new: Ember.State.extend(
      route: '/new'

      connectOutlets: (router) ->
        router.get('applicationController').connectOutlet(YJ.NewTermView)
    )

    index: Ember.State.extend(
      route: '/terms'

      connectOutlets: (router) ->
        router.get('applicationController').connectOutlet(YJ.ListTermsView)
    )

    edit: Ember.State.extend(
      route: '/terms/:term_id/edit'
    )

#    login: Ember.State.extend(
#      route: '/'
#    )
#
#    loggedOut: Ember.State.extend(
#      #EVENTS
#      login: Ember.State.transitionTo('login')
#
#      route: '/login'
#    )

  )
)