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

    toSearch: ((event) ->
      searchTerm = YJ.get('searchTerm').term
      console.log("Search is " + searchTerm)
      @transitionTo('terms.search', searchTerm)
    )

    alert: (alert) ->
      @controllerFor('application').set('alert', alert)
)
