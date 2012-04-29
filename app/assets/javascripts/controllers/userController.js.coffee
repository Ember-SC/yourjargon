YJ.userController = Em.Object.create(
  currentUser: null

  authenticate: ->
    #make a call to the server to find user with email/password
    # if success set name, email from response and create session and return true
    # if failure return false
    true


  logout: ->
    # clear session and currentUser
    # if successful return true
    # if failure return false
    true

)