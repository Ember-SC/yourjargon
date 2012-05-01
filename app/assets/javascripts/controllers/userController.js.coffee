YJ.userController = Em.Object.create(
  currentUser: null

  authenticate: ->
    #make a call to the server to find user with email/password
    # if success set currentUser from response and create session and return true
    # if failure return false
    true

  register: ->
    #make a create call to the server for a user
    # if success set currentUser from response and create session and return true
    # if failure return false
    true


  logout: ->
    # clear session and currentUser
    # if successful return true
    # if failure return false
    @set('currentUser', null)
    true

)