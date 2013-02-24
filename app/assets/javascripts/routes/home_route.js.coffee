YJ.HomeRoute = Ember.Route.extend(

 events:
   newTerm: ( ->
   	@transitionTo('terms.new')
   )
   viewTerms: ( ->
   	 @transitionTo('terms.index')
   )

 activate: () ->
   me = @
   Ember.run.next ->
     me.send('checkUser')

)
