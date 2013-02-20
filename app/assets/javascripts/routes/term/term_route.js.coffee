YJ.TermRoute = Ember.Route.extend(
  model: (params) ->
    YJ.Term.find(params.id)
)
