describe "Users Organization Selection View", ->
  beforeEach ->
    org1 = YJ.Organization.createRecord(name: "Org1")
    org2 = YJ.Organization.createRecord(name: "Org2")
    org3 = YJ.Organization.createRecord(name: "Org3")

  it "shows a list of organizations that the user belongs to", ->

  it "can select an organization from the list", ->

  it "enables creating an organization", ->

  it "enables deleting an owned organization", ->

  it "disables deleting an organization not owned", ->


