YJ.HomeRoute = Ember.Route.extend(

 events:
   newTerm: ( ->
   	@transitionTo('term.new')
   )
   viewTerms: ( ->
   	 @transitionTo('terms.index')
   )

 activate: () ->
   me = @
   Ember.run.next ->
     me.send('checkUser')

)
