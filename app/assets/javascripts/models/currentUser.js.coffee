YJ.CurrentUser = Em.Object.extend(
  id: null
  name: null
  email: null
  password: null

  # shortcut method for updating currentUser on return from server
  update: (user) ->
    @.set('id', user.id)
    @.set('name', user.name)
    @.set('email', user.email)

)