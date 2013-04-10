YJ.LoginController = Em.Controller.extend(
  email: null,
  password: null,

  login: (callback) ->
    #make a call to the server to find user with email/password
    # if success set content from response and create session and return true
    # if failure return false
    console.log("Logging in")
    self = @
    $.ajax
      type: 'POST'
      url: '/sessions'
      data: {email: @get('email'), password: @get('password')}
      dataType: 'json'
      success: (data, status) ->
        loaded = YJ.store.load(YJ.User, data.user)
        YJ.set('currentUser', YJ.User.find(loaded.id))
        $.cookie('account', data.api_key)
        self.set('email', null)
        self.set('password', null)
        callback(true)

      error: (error) ->
        console.log("Fail")
        self.set('password', null)
        callback(false)

)