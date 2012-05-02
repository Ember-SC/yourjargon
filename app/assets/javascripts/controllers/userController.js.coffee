YJ.userController = Em.Object.create(
  currentUser: null

  authenticate: ->
    #make a call to the server to find user with email/password
    # if success set currentUser from response and create session and return true
    # if failure return false
    self = @
    $.ajax
      type: 'POST'
      url: '/sessions/create'
      data: {email: @currentUser.get('email'), password: @currentUser.get('password')}
      dataType: 'json'
      success: (data) ->
        self.currentUser.update(data.user)
        true

      failure:
        false

  register: ->
    #make a create call to the server for a user
    # if success set currentUser from response and create session and return true
    # if failure return false
    self = @
    $.ajax
      type: 'POST'
      url: "/users/create"
      data: {user: {name: @currentUser.get('name'), email: @currentUser.get('email'), password: @currentUser.get('password')}}
      dataType: 'json'
      success: (data) ->
        self.currentUser.update(data.user)
        true

      failure: ->
        false


  logout: ->
    # clear session and currentUser
    # if successful return true
    # if failure return false
    @set('currentUser', null)
    true

)