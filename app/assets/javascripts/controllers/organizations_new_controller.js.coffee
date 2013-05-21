YJ.OrganizationsNewController = Ember.ObjectController.extend(
  content: null

  # Persist what we've built in this controller
  create: ->
    @get('model.transaction').commit()
    @transitionToRoute('organizations.index')

)
