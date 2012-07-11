YJ.UserController = Em.ObjectController.extend(
  content: YJ.User.create()
  api_key: null


  authenticate: ->
    #make a call to the server to find user with email/password
    # if success set content from response and create session and return true
    # if failure return false
    self = @
    $.ajax
      type: 'POST'
      url: '/sessions/create'
      data: {email: @content.get('email'), password: @content.get('password')}
      dataType: 'json'
      success: (data) ->
        console.log(data)
        self.content.update(data.user)
        self.set('api_key', data.api_key)
        true

      failure:
        false

  register: ->
    #make a create call to the server for a user
    # if success set content from response and create session and return true
    # if failure return false
    self = @
    $.ajax
      type: 'POST'
      url: "/users/create"
      data: {user: {name: @content.get('name'), email: @content.get('email'), password: @content.get('password')}}
      dataType: 'json'
      success: (data) ->
        self.content.update(data.user)
        #TODO.  Redirect the user to sign in and create a session
        true

      failure: ->
        false


  logout: ->
    # clear session and content
    # if successful return true
    # if failure return false
    @set('content', null)
    true

)