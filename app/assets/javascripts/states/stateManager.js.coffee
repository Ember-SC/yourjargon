YJ.StateManager = Em.StateManager.extend(

  # How Ember ties into the HTML page: the ID of the HTML field to be tied to
  rootElement: '#content'

  initialState: 'loggedOutState'
)
