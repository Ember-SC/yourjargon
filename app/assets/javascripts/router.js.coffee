#YJ.Router = Ember.Router.extend(
#  enableLogging: true
#  location: 'hash'
#
#  root: Ember.Route.extend(
#    # EVENTS
#    newTerm: Ember.Route.transitionTo('terms.new')
#    viewTerms: Ember.Route.transitionTo('terms.index')
#    goHome: ((router, event) ->
#      router.send('checkUser')
#    )
#    toDashboard: Ember.Route.transitionTo('users.dashboard')
#    toLogin: Ember.Route.transitionTo('users.authentication')
#    toRegister: Ember.Route.transitionTo('users.registration')
#    toEdit: Ember.Route.transitionTo('users.edit')
#    toOrganizations: Ember.Route.transitionTo('organizations.index')
#    cancel: Ember.Route.transitionTo('home')
#    logout: ((router, event) ->
#      router.get('userController').logout()
#      $.removeCookie('account')
#      router.send('goHome')
#    )
#    termCreated: ((router, event) ->
#      router.transitionTo('terms.index')
#    )
#
#    checkUser: ((router, event) ->
#      cookie = $.cookie('account')
#      Ember.run.next ->
#        if cookie
#          console.log("Me gots a cookie")
#          if YJ.User.loadFromCookie(cookie)
#            console.log("We be routin to dashboard")
#            router.transitionTo('users.dashboard')
#          else
#            $.removeCookie('account')
#            router.transitionTo('home')
#        else
#          router.transitionTo('home')
#    )
#
#    home: Ember.Route.extend(
#      route: '/'
#
#      enter: (router) ->
#        Ember.run.next ->
#          router.send('checkUser')
#
#
#      connectOutlets: (router) ->
#        appController = router.get('applicationController')
#        appController.connectOutlet('home')
#    )
#
#    users: YJ.UsersRoute
#
#    organizations: YJ.OrganizationsRoute
#
#    terms: YJ.TermsRoute
#  )

YJ.Router.map ->
  @route "home",
    path: "/"
