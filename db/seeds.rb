# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
Membership.destroy_all
Term.destroy_all
Organization.destroy_all
User.destroy_all
user = User.create()
user.email = "admin@yourjargon.com"
user.password = "password"
user.save!

org = user.create_organization('Programmer Jargon')

Term.create(YAML.load_file(Rails.root.join('db/sample', 'terms.yml')))
terms = Term.all
terms.each {|t| t.organization = org; t.save!}
