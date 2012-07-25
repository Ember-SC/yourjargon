YJ.User = DS.Model.extend(
  name: DS.attr("string")
  email: DS.attr("string")
  password: DS.attr("string")  # FIXME remove me
  apiKey: DS.attr("string") # FIXME remove me

  memberships: DS.hasMany("YJ.Membership")
)
