# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Role.delete_all
roles = Role.create([{ name: 'Carry' }, { name: 'Solo Mid' }, { name: 'Offlane' }, { name: 'Support' }, { name: 'Jungler' }])
