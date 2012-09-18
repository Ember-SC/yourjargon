YJ.Router = Ember.Router.extend(
  enableLogging: true
  location: 'hash'

  root: Ember.Route.extend(
    # EVENTS
    newTerm: Ember.Route.transitionTo('terms.new')
    viewTerms: Ember.Route.transitionTo('terms.index')
    goHome: ((router, event) ->
      router.send('checkUser')
    )
    toLogin: Ember.Route.transitionTo('users.authentication')
    toRegister: Ember.Route.transitionTo('users.registration')
    toEdit: Ember.Route.transitionTo('users.edit')
    toOrganizations: Ember.Route.transitionTo('organizations.index')
    cancel: Ember.Route.transitionTo('home')
    logout: ((router, event) ->
      router.get('userController').logout()
      $.removeCookie('account')
      router.send('goHome')
    )

    checkUser: ((router, event) ->
      cookie = $.cookie('account')
      if cookie
        console.log("Me gots a cookie")
        if YJ.User.loadFromCookie(cookie)
          console.log("We be routin to dashboard")
          router.transitionTo('users.dashboard')
        else
          $.removeCookie('account')
          router.transitionTo('home')
      else
        router.transitionTo('home')
    )

    toSearch: Ember.Route.transitionTo('terms.search')

    home: Ember.Route.extend(
      route: '/'

      enter: (router) ->
        router.send('checkUser')


      connectOutlets: (router) ->
        appController = router.get('applicationController')
        appController.connectOutlet('home')
    )

    users: YJ.UsersRoute

    terms: YJ.TermsRoute

    organizations: YJ.OrganizationsRoute
  )
)
