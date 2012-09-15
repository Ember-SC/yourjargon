YJ.OrganizationEditController = Ember.ObjectController.extend(
  content: null

  # Persist what we've built in this controller
  save: ->
    organization = @get('content')
  #organization.get('transaction').commit()

)
