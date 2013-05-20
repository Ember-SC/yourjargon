YJ.UserSignupController = Em.Controller.extend(
  name: null
  email: null
  password: null

  signup: ->
    #make a create call to the server for a user
    # if success set content from response and create session and return true
    # if failure return false
    console.log(JSON.stringify({name: @get('name'), email: @get('email'), password: @get('password')}))
    self = @
    signup = $.ajax
      type: 'POST'
      url: "/api/users"
      data: {user: {name: @get('name'), email: @get('email'), password: @get('password')}}
      dataType: 'json'

    signup.then ( (data) ->
      loaded = YJ.store.load(YJ.User, data.user)
      YJ.set('currentUser', YJ.User.find(loaded.id))
      Ember.$.cookie('account', data.api_key)
      self.clearFields()
      self.transitionToRoute('user.dashboard')
    ), ->
      self.set('password', null)
      alert = YJ.Alert.create(
        message: "Whoops! An error occured while signing up.",
        type: 'error'
      )
      self.send('alert', alert)

  clearFields: ->
    @set('email', null)
    @set('name', null)
    @set('password', null)
)