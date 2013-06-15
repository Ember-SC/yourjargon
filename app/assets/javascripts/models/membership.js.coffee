YJ.Membership = DS.Model.extend(
  organization: DS.belongsTo("YJ.Organization")
  user: DS.belongsTo("YJ.User")
  isOwner: DS.attr("boolean")
  canModify: DS.attr("boolean")
  relationshipsLoaded: Ember.computed ->
  	@get('user.isLoaded') and @get('organization.isLoaded')
  .property('user.isLoaded', 'organization.isLoaded')
)
