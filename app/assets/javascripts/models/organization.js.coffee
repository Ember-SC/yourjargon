##
# Created with JetBrains RubyMine.
# User: scott
# Date: 7/24/12
# Time: 8:30 PM
# To change this template use File | Settings | File Templates.
#

YJ.Organization = DS.Model.extend(
  name: DS.attr("string")
  ownership: DS.belongsTo("YJ.Membership")
  memberships: DS.hasMany("YJ.Membership")

  addMembership: (user) ->


  setOwner: (owner) ->
    owner.join(@, true)
    membership = @.enroll(owner)
    @set('ownership', membership)

  getOwner: ->

  enroll: (user) ->
    membership = YJ.Membership.createRecord(user: user, organization: @)
    @memberships.pushObject(membership)
    membership

  drop: (user) ->
    membership = @memberships
    @memberships.removeObject()



)
