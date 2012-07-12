YJ.LoginController = Em.ObjectController.extend(
  content: null

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
        self.content.update(data.user)
        self.set('password', null)
        true

      failure:
        false

)