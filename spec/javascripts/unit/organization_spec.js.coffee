//= require spec

test("organization has memberships", ->
	organization = {}
	Ember.run(->
		user1 = YJ.User.createRecord(
			email: "me1@example.com"
		)
		user2 = YJ.User.createRecord(
			email: "me2@example.com"
		)
		organization = YJ.Organization.build(user1)
		organization.enroll(user2)
	)
	memberships = organization.get('memberships')
	equal(memberships.get('length'), 2, "Have two memberships")
)