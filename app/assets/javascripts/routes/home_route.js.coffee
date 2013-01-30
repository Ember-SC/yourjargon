#YJ.HomeRoute = Ember.Route.extend(
#
#  events:
##    newTerm: Ember.Route.transitionTo('terms.new')
##    viewTerms: Ember.Route.transitionTo('terms.index')
#    goHome: ((router, event) ->
#      router.send('checkUser')
#    )
#    toDashboard: ((controller, event) ->
#      controller.transitionTo('users.dashboard')
#    )
#
#    toLogin: ( ->
#      @transitionTo('users.authentication')
#    )
#
##    toRegister: Ember.Route.transitionTo('users.registration')
##    toEdit: Ember.Route.transitionTo('users.edit')
##    toOrganizations: Ember.Route.transitionTo('organizations.index')
##    cancel: Ember.Route.transitionTo('home')
#    logout: ((router, event) ->
#      router.get('userController').logout()
#      $.removeCookie('account')
#      router.send('goHome')
#    )
#    termCreated: ((router, event) ->
#      router.transitionTo('terms.index')
#    )
#
#    checkUser: ((event) ->
#      controller = @controllerFor('application')
#      cookie = $.cookie('account')
#      Ember.run.next ->
#        if cookie
#          console.log("Me gots a cookie")
#          if YJ.User.loadFromCookie(cookie)
#            console.log("We be routin to dashboard")
#            controller.transitionTo('users.dashboard')
#          else
#            $.removeCookie('account')
#            controller.transitionTo('home')
#        else
#          controller.transitionTo('home')
#    )
#
#  enter: () ->
#    me = @
#    Ember.run.next ->
#      me.send('checkUser')
#
#)
