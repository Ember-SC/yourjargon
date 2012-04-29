YJ.StateManager.reopen(

  registerState: Ember.ViewState.create(
    view: YJ.RegisterView

    #
    doRegister: (manager) ->
      if YJ.userController.register() then manager.goToState('listTermsState') else manager.goToState('loggedOutState')

    cancel: (manager) ->
      manager.goToState('listTermsState')


    login: (manager) ->
      manager.goToState('loginState')



  )

)