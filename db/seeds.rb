# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
Term.create(YAML.load_file(Rails.root.join('db/sample', 'terms.yml')))
