YJ.StateManager.reopen(

  loggedOutState: Em.ViewState.create(
    view: YJ.MainView

    login: (manager) ->
      YJ.userController.set('currentUser', YJ.CurrentUser.create())
      manager.goToState('loginState')

  )
)