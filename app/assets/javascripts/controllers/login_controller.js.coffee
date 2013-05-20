YJ.UserLoginController = Em.Controller.extend(
  email: null,
  password: null,

  login: (callback) ->
    #make a call to the server to find user with email/password
    # if success set content from response and create session and return true
    # if failure return false
    self = @
    login = Ember.$.ajax
      type: 'POST'
      url: '/api/sessions'
      data: {email: @get('email'), password: @get('password')}
      dataType: 'json'

    login.then ( (data) ->
      loaded = YJ.store.load(YJ.User, data.user)
      YJ.set('currentUser', YJ.User.find(loaded.id))
      Ember.$.cookie('account', data.api_key)
      self.clearFields()
      self.transitionToRoute('user.dashboard')
    ), ->
      self.set('password', null)
      alert = YJ.Alert.create(
        type: 'error'
        message: "Sorry. Could not login with that username and password."
      )
      self.send('alert', alert)

  clearFields: ->
    this.set('email', null)
    this.set('password', null)

)