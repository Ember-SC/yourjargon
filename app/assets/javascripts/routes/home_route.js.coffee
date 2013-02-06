YJ.HomeRoute = Ember.Route.extend(

 events:
   newTerm: ( ->
   	@transitionTo('terms.new')
   )
   viewTerms: ( ->
   	 @transitionTo('terms')
   )
   toLogin: ( ->
     @transitionTo('user.login')
   )

   checkUser: ((event) ->
     controller = @controllerFor('application')
     cookie = $.cookie('account')
     me = @
     Ember.run.next ->
       if cookie
         console.log("Me gots a cookie")
         if YJ.User.loadFromCookie(cookie)
           console.log("We be routin to dashboard")
           me.transitionTo('user.dashboard')
         else
           $.removeCookie('account')
           me.transitionTo('home')
       else
       	me.transitionTo('home')
   )

 enter: () ->
   me = @
   Ember.run.next ->
     me.send('checkUser')

)
