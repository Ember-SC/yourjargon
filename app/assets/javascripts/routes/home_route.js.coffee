YJ.HomeRoute = Ember.Route.extend(

 events:
   viewTerms: ( ->
   	 @transitionTo('terms.index')
   )

 activate: () ->
   me = @
   Ember.run.next ->
     me.send('checkUser')

)
