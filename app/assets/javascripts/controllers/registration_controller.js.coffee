YJ.RegistrationController = Em.ObjectController.extend(
  content: null

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
        self.content.set('password', null)
        return true

      failure: ->
        return false
)