# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Doorkeeper::Application.where(
  name: 'HowAmIDoing',
  redirect_uri: 'https://api.HowAmIDoing.com',
  uid: ENV['DOORKEEPER_APP_UID'],
  secret: ENV['DOORKEEPER_APP_SECRET']
).first_or_create