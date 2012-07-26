##
# Created with JetBrains RubyMine.
# User: scott
# Date: 7/24/12
# Time: 8:30 PM
# To change this template use File | Settings | File Templates.
#

YJ.Organization = DS.Model.extend(
  name: DS.attr("string")
  owner: DS.belongsTo("YJ.Membership")
  members: DS.hasMany("YJ.Membership")

  addMembership: (user) ->


  setOwner: (owner) ->
    @owner.set('owner', addMembership(owner))

)
