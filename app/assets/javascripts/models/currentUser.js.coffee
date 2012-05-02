YJ.CurrentUser = Em.Object.extend(
  id: null
  name: null
  email: null
  password: null

  create: ->
    self = @
    #send an ajax call to the server to create the user
    # /user/create params name/email/password
    $.ajax
      type: 'POST'
      url: "/users/create"
      data: {user: {name: @get('name'), email: @get('email'), password: @get('password')}}
      dataType: 'json'
      success: (data) ->
        user = data.user
        console.log(user)
        self.set('id', user.id)
        self.set('name', user.name)
        self.set('email', user.email)



)