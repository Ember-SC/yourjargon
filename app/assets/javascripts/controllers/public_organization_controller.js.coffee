YJ.PublicOrganizationController = Em.ObjectController.extend(
   content: null

   enroll: (name, email) ->
     user = YJ.User.createRecord(name: name, email: email)
     @get('content').enroll(user)
     user

   createPublicOrganization: ->
     org = YJ.Organization.createRecord(name: "Public Organization")  #FIXME assign god as owner
     @set('content', org)
)