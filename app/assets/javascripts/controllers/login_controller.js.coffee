YJ.LoginController = Em.Controller.extend(
  email: null,
  password: null

  authenticate: ->
    #make a call to the server to find user with email/password
    # if success set content from response and create session and return true
    # if failure return false
    self = @
    $.ajax
      type: 'POST'
      url: '/sessions'
      data: {email: @get('email'), password: @get('password')}
      dataType: 'json'
      success: (data) ->
        loaded = YJ.store.load(YJ.User, data.user)
        YJ.set('currentUser', YJ.User.find(loaded.id))
        self.set('password', null)
        true

      failure:
        false

)