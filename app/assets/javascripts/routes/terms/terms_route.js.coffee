YJ.TermsRoute = Ember.Route.extend(

  model: ->
    YJ.Term.find()
)
