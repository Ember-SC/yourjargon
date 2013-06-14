YJ.HomeRoute = Ember.Route.extend(

 events:
   viewTerms: ( ->
   	 @transitionTo('terms.index')
   )
)
