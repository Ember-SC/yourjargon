# Defer readiness here so we can do a quick check on the user and send it over if we have one.
# see user.js.coffee for advanceReadiness() after checking for user.
Ember.Application.initializer(
  name: 'currentUser'
  initialize: (container) ->
    cookie = Ember.$.cookie('account')
    return unless cookie
    YJ.deferReadiness()
    Ember.$.getJSON("/api/users/#{cookie}")
    .then( (data) ->
      loaded = YJ.store.load(YJ.User, data.user)
      YJ.set('currentUser', YJ.User.find(loaded.id))
      YJ.advanceReadiness()
    , ->
      YJ.advanceReadiness()
    )
)