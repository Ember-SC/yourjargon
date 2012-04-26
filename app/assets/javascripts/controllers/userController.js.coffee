YJ.userController = Em.Object.create(
  create: (name, email, password) ->
    #make a call to the server to create user.
    #if success then do this
    @setValues(name, email)


  login: (email, password) ->
    #make a call to the server to find user with email/password
    # if success set name, email from response and create session
    # if failure do nothing?
    name = "DefaultForNow"
    console.log("logging in:")
    console.log(email)
    @setValues(name, email)
    YJ.stateManager.goToState('listTermsState')

  logout: ->
    # clear session and currentUser
    YJ.currentUser.set('name', "Guest")
    YJ.currentUser.set('email', null)


  setValues: (name, email) ->
    YJ.currentUser.set('name', name)
    YJ.currentUser.set('email', email)

)