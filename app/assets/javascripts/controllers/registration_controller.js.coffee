YJ.RegistrationController = Em.Controller.extend(
  name: null
  email: null
  password: null

  register: ->
    #make a create call to the server for a user
    # if success set content from response and create session and return true
    # if failure return false
    self = @
    $.ajax
      type: 'POST'
      url: "/users"
      data: {user: {name: @get('name'), email: @get('email'), password: @get('password')}}
      dataType: 'json'
      success: (data) ->
        loaded = YJ.store.load(YJ.User, data.user)
        YJ.set('currentUser', YJ.User.find(loaded.id))
        self.clearProperties()
        return true

      failure: ->
        return false

  clearProperties: ->
    @set('email', null)
    @set('name', null)
    @set('password', null)
)