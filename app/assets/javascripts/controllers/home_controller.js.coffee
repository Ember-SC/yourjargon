YJ.HomeController = Ember.Controller.extend(

  viewTerms: (->
    @transitionTo('terms')
  )
)
