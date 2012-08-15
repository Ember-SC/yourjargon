YJ.PublicOrganizationController = Em.ObjectController.extend(
   content: null

   enroll: (name, email) ->
     user = YJ.User.createRecord(name: name, email: email)
     @get('content').enroll(user)
     user

   createPublicOrganization: ->
     org = YJ.Organization.createRecord(name: "Public Organization")
     org.set('owner', YJ.get('god'))
     @set('content', org)
)
