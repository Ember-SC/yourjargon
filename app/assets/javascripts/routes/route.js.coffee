Ember.Route.reopen(
  events:
    checkUser: ->
      # controller = @controllerFor('application')
      # cookie = $.cookie('account')
      # me = @
      # Ember.run.next ->
      #   if cookie
      #     console.log("Me gots a cookie")
      #     if YJ.User.loadFromCookie(cookie)
      #       console.log("We be routin to dashboard")
      #       me.transitionTo('user.dashboard')
      #     else
      #       $.removeCookie('account')
      #       me.transitionTo('user.dashboard')
      #   else
      #     me.transitionTo('home')

    toSearch: ( ->
      searchPhrase = YJ.get('searchPhrase')
      console.log("Search is " + searchPhrase)
      controller = @controllerFor('termsIndex')
      controller.set('searchPhrase', searchPhrase)
      controller.computeSearchResults()
    )

    alert: (alert) ->
      @controllerFor('application').set('alert', alert)
)
