YJ.StateManager.reopen(

  loginState: Ember.ViewState.create(
    view: YJ.LoginView

    authenticate: (manager) ->
      if YJ.userController.authenticate() then manager.goToState('listTermsState') else manager.goToState('loggedOutState')

    cancel: (manager) ->
      manager.goToState('loggedOutState')

    register: (manager) ->
      manager.goToState('registerState')

  )
)